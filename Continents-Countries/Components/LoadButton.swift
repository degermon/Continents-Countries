//
//  LoadButton.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI

struct LoadButton: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countriesDataService: CountriesDataService
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            countriesDataService.getCountriesWorldwide()
        }, label: {
            HStack {
                Text(countriesDataService.allCountries.isEmpty ? "Load Continents" : "Reload Continents")
                Image(systemName: countriesDataService.allCountries.isEmpty ? "icloud.and.arrow.down" : "arrow.counterclockwise")
            } //: HSTACK
            .padding()
            .font(.title)
            .background(Capsule().strokeBorder(Color("ColorCustomLightPurple"), lineWidth: 4))
            .shadow(radius: 4)
        })
        .accentColor(Color("ColorCustomLightPurple"))
        .padding(7)
    }
}

// MARK: - PREVIEW

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        LoadButton()
            .environmentObject(CountriesDataService())
            .previewLayout(.sizeThatFits)
    }
}
