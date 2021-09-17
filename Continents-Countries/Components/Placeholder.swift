//
//  Placeholder.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-17.
//

import SwiftUI

struct Placeholder: View {
    var body: some View {
        Image("globe")
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color("ColorCustomGray"))
            .clipShape(Circle())
    }
}

struct Placeholder_Previews: PreviewProvider {
    static var previews: some View {
        Placeholder()
            .previewLayout(.sizeThatFits)
    }
}
