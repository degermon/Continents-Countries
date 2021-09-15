//
//  CountriesDataService.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI
import Combine

class CountriesDataService: ObservableObject {
    
    @Published var allCountries = [Country]()
    @Published var isLoading: Bool = false
    var countriesSubscription: AnyCancellable?
    
    func getCountriesWorldwide() {
        
        isLoading = true
        
        guard let url = URL(string: "https://pkgstore.datahub.io/JohnSnowLabs/country-and-continent-codes-list/country-and-continent-codes-list-csv_json/data/c218eebbf2f8545f3db9051ac893d69c/country-and-continent-codes-list-csv_json.json") else { return }
        
        countriesSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ [unowned self] output -> Data in
                self.isLoading = false
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode >= 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: [Country].self, decoder: JSONDecoder())
            .replaceError(with: []) // if fails to decode simply return empty array
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnedCountries in
                self?.allCountries = returnedCountries
                self?.countriesSubscription?.cancel()
            }
    }
}
