//
//  ListTitle.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-17.
//

import SwiftUI

struct ListTitle: View {
    var body: some View {
        Text("Continents & Countries")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(Color("ColorCustomRed"))
            .shadow(radius: 4)
            .modifier(ScalingText())
    }
}

struct ListTitle_Previews: PreviewProvider {
    static var previews: some View {
        ListTitle()
            .previewLayout(.sizeThatFits)
    }
}
