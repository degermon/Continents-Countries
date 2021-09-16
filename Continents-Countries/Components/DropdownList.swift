//
//  DropdownList.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-15.
//

import SwiftUI

struct DropdownList: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countryViewModel: CountryViewModel
    @State private var isExpanded = false
    @State private var countryList: [Country] = []
    var continent: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            withAnimation {
                DisclosureGroup("\(continent)", isExpanded: $isExpanded) {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(countryList) { country in
                            Text(country.countryName ?? "No name")
                                .font(.title3)
                                .padding(10) // for texh identation
                        }
                    } //: VSTACK
                    .frame(maxWidth: .infinity, alignment: .leading) // so expanded/shown text is left-justified
                } //: DISCLOSURE
                .accentColor(.white)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
            } //: ANIMATION
            Spacer()
        } //: VSTACK
        .animation(.linear)
        .onAppear {
            countryList = countryViewModel.fetchCountriesFor(continent: continent)
        }
    }
}

// MARK: - PREVIEW

struct DropdownList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownList(continent: "Africa")
            .environmentObject(CountryViewModel())
            .padding()
    }
}
