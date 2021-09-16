//
//  SequenceExtension.swift
//  Continents-Countries
//
//  Created by Daniel Šuškevič on 2021-09-16.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] { // removing duplicates in array
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
