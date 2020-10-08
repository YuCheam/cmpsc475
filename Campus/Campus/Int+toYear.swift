//
//  Int+toYear.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/8/20.
//

import Foundation

extension Int {
    var toYear: String {
        String(format: "%04d", self)
    }
}
