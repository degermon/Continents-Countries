//
//  Continents_CountriesApp.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI

@main
struct Continents_CountriesApp: App {
    
    @StateObject var countryViewModel = CountryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(countryViewModel)
        }
    }
}
