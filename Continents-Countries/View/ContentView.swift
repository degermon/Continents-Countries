//
//  ContentView.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countriesDataService: CountriesDataService
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            if countriesDataService.isLoading {
                Spacer()
                ProgressView()
            } else {
                List {
                    ForEach(countriesDataService.allCountries) { country in
                        Text(country.countryName ?? "No name")
                    }
                }
            }
            Spacer()
            LoadButton()
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CountriesDataService())
    }
}
