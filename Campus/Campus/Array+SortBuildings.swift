//
//  Array+SortBuildings.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/7/20.
//

import Foundation

extension Array where Element == Building {
    mutating func sort() -> [Building] {
        return self.sort(by: { $0.name < $1.name })
    }
    
}
