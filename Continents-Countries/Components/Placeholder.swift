//
//  Placeholder.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-17.
//

import SwiftUI

struct Placeholder: View {
    var body: some View {
        VStack(spacing: 8) {
            Image("globe")
                .resizable()
                .scaledToFit()
                .padding()
                .background(Color("ColorCustomGray"))
                .clipShape(Circle())
            Text("No data available")
                .font(Font.custom("ChalkboardSE-Bold", size: 40))
                .foregroundColor(Color("ColorCustomRed"))
                .modifier(ScalingText())
        }
        .shadow(radius: 5)
    }
}

struct Placeholder_Previews: PreviewProvider {
    static var previews: some View {
        Placeholder()
            .previewLayout(.sizeThatFits)
    }
}
