//
//  String+capitalize.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/17/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

extension String {
    var capitalize: String {
        self.prefix(1).uppercased() + dropFirst()
    }
}
