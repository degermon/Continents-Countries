//
//  Continents_CountriesTests.swift
//  Continents-CountriesTests
//
//  Created by Daniel Šuškevič on 2021-09-18.
//

import XCTest
@testable import Continents_Countries

class Continents_CountriesTests: XCTestCase {
    
    var sut: CountryViewModel!

    override func setUpWithError() throws {
        sut = CountryViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testShortenCountryNameCorrectly() {
        // given
        let country = Country(continentCode: nil, continentName: nil, countryName: "Test name, this should not be seen in result", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil)
        let expectedCountryShortenedName = "Test name"
        
        // when
        let shortenedCountryName = sut.shortenCountryNameFor(country: country.countryName)
        
        //then
        XCTAssertEqual(shortenedCountryName, expectedCountryShortenedName)
    }
    
    func testCountryListFetchForSpecificContinent() {
        // given
        sut.allCountries = [
            Country(continentCode: nil, continentName: "Africa", countryName: "Test case1", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil),
            Country(continentCode: nil, continentName: "Africa", countryName: "Test case2", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil),
            Country(continentCode: nil, continentName: "Europe", countryName: "Test case3", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil),
            Country(continentCode: nil, continentName: "Africa", countryName: "Test case4", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil),
            Country(continentCode: nil, continentName: "Antarctica", countryName: "Test case5", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil)
        ]
        let testFetchContinet = "Africa"
        let expectedCountryNameList = ["Test case1", "Test case2", "Test case4"]
        
        //when
        let filteredCountryList = sut.fetchCountriesFor(continent: testFetchContinet)
        let filteredCountriesNameList = filteredCountryList.map {$0.countryName}
        
        //then
        XCTAssertEqual(expectedCountryNameList, filteredCountriesNameList)
    }
}
