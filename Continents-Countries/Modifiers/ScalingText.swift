//
//  ScalingText.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-17.
//

import SwiftUI

struct ScalingText: ViewModifier { // keeps whole text on screen, downscaling if needed
    func body(content: Content) -> some View {
        content
//            .scaledToFit()
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
}
