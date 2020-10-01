//
//  Int+StringFormat.swift
//  Pokedex
//
//  Created by Kha-Yu Cheam on 9/29/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

extension Int {
    var formatString: String {
        String(format: "%03d", self)
    }
}
