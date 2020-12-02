//
//  Date+Extension.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/28/20.
//

import SwiftUI

extension Date {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: self)
    }
}
