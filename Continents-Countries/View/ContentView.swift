//
//  ContentView.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countryViewModel: CountryViewModel
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 7) {
            ListTitle()
                .padding(.leading, 5)
                .padding(.trailing, 5)
            if countryViewModel.allCountries.isEmpty && !countryViewModel.isLoading {
                Placeholder()
                    .offset(CGSize(width: 0, height: UIScreen.main.bounds.height * 0.2))
            }
            if countryViewModel.isLoading {
                Spacer()
                LoadingIndicator(animation: .threeBallsTriangle, color: Color("ColorCustomRed"), size: .large, speed: .normal)
                Spacer()
            } else {
                ScrollView(.vertical) {
                    ForEach(countryViewModel.allContinents, id: \.self) { continent in
                        DropdownList(continent: continent)
                            .shadow(radius: 8)
                    } //: LOOP
                    .padding()
                } //: LIST
            }
            LoadButton()
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountryViewModel())
    }
}
