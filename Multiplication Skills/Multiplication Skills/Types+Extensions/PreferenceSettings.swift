//
//  PreferenceSettings.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/17/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

struct DifficultySettings {
    static let easyMultiplication = [1,10]
    static let mediumMultiplication = [7, 15]
    static let hardMultiplication = [12,30]
    
    static let easyAddition = [1,10]
    static let mediumAddition = [7, 99]
    static let hardAddition = [50, 999]
    
    var currentDifficulty: Difficulty = .easy
    var currentArithmetic: Arithmetic = .multiplication
    
    var range: [Int] {
        switch currentDifficulty {
        case .easy:
            return currentArithmetic == .multiplication ? DifficultySettings.easyMultiplication : DifficultySettings.hardMultiplication
        case .medium:
            return currentArithmetic == .multiplication ? DifficultySettings.mediumMultiplication : DifficultySettings.mediumAddition
        default: // hard
            return currentArithmetic == .multiplication ? DifficultySettings.hardMultiplication : DifficultySettings.hardAddition
        }
    }
    
    var startRange: Int { range[0] }
    var endRange: Int { range[1] }
}
