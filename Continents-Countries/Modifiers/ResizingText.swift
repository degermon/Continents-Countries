//
//  ResizingText.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-17.
//

import SwiftUI

struct ResizingText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .minimumScaleFactor(0.1)
            .lineLimit(1)
    }
}
