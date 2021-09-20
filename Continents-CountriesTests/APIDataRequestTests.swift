//
//  APIDataRequestTests.swift
//  Continents-CountriesTests
//
//  Created by Daniel Šuškevič on 2021-09-20.
//

import XCTest
@testable import Continents_Countries

class APIDataRequestTests: XCTestCase {
    
    var urlSession: URLSession!

    override func setUpWithError() throws {
        // Set url session for mock testing
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }

    override func tearDownWithError() throws {
        urlSession = nil
    }
    
    func testGetCountriesList() throws {
        // Injected custom url session for mocking
        let countriesDataService = CountriesDataService(urlSession: urlSession)
        
        // Mock data
        let sampleCountriesData = [Country(continentCode: nil, continentName: "Africa", countryName: "Kenya", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil),
                                   Country(continentCode: nil, continentName: "Africa", countryName: "Somalia", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil),
                                   Country(continentCode: nil, continentName: "Africa", countryName: "Algeria", countryNumber: nil, threeLetterCountryCode: nil, twoLetterCountryCode: nil)]
        let mockData = try JSONEncoder().encode(sampleCountriesData)
        
        // Return data in mock request handler
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }
        
        // Expectation to test async code.
        let expectation = XCTestExpectation(description: "response")
        
        // Mock network request to get country list
        countriesDataService.getCountriesList { fetchedCountryList in
            XCTAssertEqual(fetchedCountryList.count, 3)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}

// MARK: - MOCK URL PROTOCOL

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Received unexpected request with no handler set")
            return
        }
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
    }
}
