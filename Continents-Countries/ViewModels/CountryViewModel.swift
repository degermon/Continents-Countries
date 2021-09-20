//
//  CountryViewModel.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-16.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    
    @Published var allCountries = [Country]() {
        didSet {
            filterAllContinents()
        }
    }
    @Published var allContinents = [String]() // array of all continents
    @Published var isLoading: Bool = false // Boolean value for loading/processing data
    private let countriesDataService = CountriesDataService()
    
    // MARK: - FUNCTIONS
    
    func fetchAllCountriesList() {
        isLoading = true
        countriesDataService.getCountriesList { [weak self] fetchedCountryList in
            self?.allCountries = fetchedCountryList
        }
    }
    
    func fetchCountriesFor(continent: String) -> [Country] {
        let countriesOnTheContinent = allCountries
            .filter {$0.continentName == continent} // filter for countries on specified continent
            .sorted { first, second in
                let firstCountry = first.countryName ?? ""
                let secondCountry = second.countryName ?? ""
                return firstCountry < secondCountry
            } // sort countries alphabetically
        return countriesOnTheContinent
    }
    
    func shortenCountryNameFor(country: String?) -> String { // shorten country name, remove averything after the comma if it is present in the name
        guard let countryName = country else { return "" }
        let parts = countryName.split(separator: ",")
        let shortCountryName = String(parts[0])
        return shortCountryName
    }
    
    private func filterAllContinents() {
        let continents = allCountries
            .map{ $0.continentName } // get all continets from array of countries
        allContinents = continents
            .uniqued() // remove all duplicates for contients
            .compactMap{$0} // remove any possible nil values
            .sorted() // sort it alphabetically
        isLoading = false
    }
}
