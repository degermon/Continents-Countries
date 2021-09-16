//
//  CountriesDataService.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI
import Combine

class CountriesDataService {
    
    @Published var allCountries = [Country]()
    var countriesSubscription: AnyCancellable?
    
    func getCountriesList() {
        guard let url = URL(string: "https://pkgstore.datahub.io/JohnSnowLabs/country-and-continent-codes-list/country-and-continent-codes-list-csv_json/data/c218eebbf2f8545f3db9051ac893d69c/country-and-continent-codes-list-csv_json.json") else { return }
        
        countriesSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background)) // subscribe on background thread, should be there by default
            .receive(on: DispatchQueue.main) // receive it on main thread
            .tryMap({ output -> Data in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode >= 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            })
            .decode(type: [Country].self, decoder: JSONDecoder()) // decode data
            .replaceError(with: []) // if fails to decode simply replace with empty array
            .sink(receiveValue: { [weak self] returnedCountries in
                self?.allCountries = returnedCountries
                self?.countriesSubscription?.cancel()
            })
    }
}
