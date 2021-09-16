//
//  CountryViewModel.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-16.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    
    @Published var allCountries = [Country]() {
        didSet {
            filtertAllContinents()
        }
    }
    @Published var allContinents = [String]() // array of all continents
    @Published var isLoading: Bool = false // Boolean value for loading/processing data
    
    private let countriesDataService = CountriesDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func fetchAllCountriesList() {
        isLoading = true
        countriesDataService.getCountriesList()
    }
    
    func fetchCountriesFor(continent: String) -> [Country] {
        let countriesOnTheContinent = allCountries.filter {$0.continentName == continent}.compactMap{$0}
        return countriesOnTheContinent
    }
    
    private func addSubscribers() {
        countriesDataService.$allCountries
            .sink { [weak self] returnedCountries in
                self?.allCountries = returnedCountries
            }
            .store(in: &cancellables)
    }
    
    private func filtertAllContinents() {
        let continents = allCountries.map{ $0.continentName } // get all continets from array of countries
        allContinents = continents.uniqued().compactMap{$0}.sorted() // remove all duplicates for contients, remove any possible nil values and sort it alphabetically
        isLoading = false
    }
}
