//
//  Country.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import Foundation

struct CountriesWorldwide: Codable {
    let countries: [Country]
}

struct Country: Codable, Identifiable {
    let id = UUID()
    let continentCode: String?
    let continentName: String?
    let countryName: String?
    let countryNumber: Int?
    let threeLetterCountryCode: String?
    let twoLetterCountryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case continentCode = "Continent_Code"
        case continentName = "Continent_Name"
        case countryName = "Country_Name"
        case countryNumber = "Country_Number"
        case threeLetterCountryCode = "Three_Letter_Country_Code"
        case twoLetterCountryCode = "Two_Letter_Country_Code"
    }
}
