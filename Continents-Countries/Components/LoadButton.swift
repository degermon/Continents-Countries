//
//  LoadButton.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI

struct LoadButton: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countryViewModel: CountryViewModel
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            countryViewModel.fetchAllCountriesList()
        }, label: {
            HStack {
                Text(countryViewModel.allContinents.isEmpty ? "Load Continents" : "Reload Continents")
                Image(systemName: countryViewModel.allContinents.isEmpty ? "icloud.and.arrow.down" : "arrow.counterclockwise")
            } //: HSTACK
            .padding()
            .font(.title)
            .background(Capsule().strokeBorder(Color("ColorCustomLightPurple"), lineWidth: 4))
            .shadow(radius: 4)
        }) //: BUTTON
        .accentColor(Color("ColorCustomLightPurple"))
        .padding(9)
    }
}

// MARK: - PREVIEW

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        LoadButton()
            .environmentObject(CountryViewModel())
            .previewLayout(.sizeThatFits)
    }
}
