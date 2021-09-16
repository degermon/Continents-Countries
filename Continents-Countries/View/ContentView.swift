//
//  ContentView.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countryViewModel: CountryViewModel
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 5) {
            if countryViewModel.isLoading {
                Spacer()
                ProgressView()
            } else {
                List {
                    ForEach(countryViewModel.allContinents, id: \.self) { continent in
                        DropdownList(continent: continent)
                    }
                } //: LIST
            }
            Spacer()
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
