//
//  DropdownList.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-17.
//

import SwiftUI

struct DropdownList: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var countryViewModel: CountryViewModel
    @State private var expand = false
    @State private var countryList: [Country] = []
    var continent: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Spacer()
                Text("\(continent)")
                    .fontWeight(.medium)
                    .font(.title)
                    .modifier(ScalingText())
                Spacer()
                Image(systemName: expand ? "chevron.up": "chevron.down")
                    .resizable()
                    .frame(width: 20, height: 12)
            } //: HSTACK
            .foregroundColor(Color("ColorCustomWhite"))
            .onTapGesture {
                self.expand.toggle()
            } //: TAP
            
            if expand {
                ForEach(countryList) { country in
                    Text(countryViewModel.shortenCountryNameFor(country: country.countryName))
                        .font(.title3)
                        .foregroundColor(Color("ColorCustomWhite"))
                        .lineLimit(2)
                        .padding(10)
                    if country != countryList.last {
                        Divider()
                    } // don't need divider after the lst element
                } //: LOOP
            } // IF EXPANDED
        } //: VSTACK
        .padding(7)
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .animation(.spring())
        .onAppear {
            countryList = countryViewModel.fetchCountriesFor(continent: continent)
        } //: ON APPEAR
    }
}

// MARK: - PREVIEW

struct DropDownList2_Previews: PreviewProvider {
    static var previews: some View {
        DropdownList(continent: "Africa")
            .environmentObject(CountryViewModel())
            .padding()
    }
}
