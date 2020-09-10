//
//  Color+ButtonBackground.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/9/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static func answerBackground(state: State, select userSelectedAnswer: Int, currentAnswer: Int, correctAnswer: Int) -> Color {
        switch state {
        case .next, .restart:
            if (currentAnswer == correctAnswer) {
                return Color.green
            } else if (currentAnswer != correctAnswer) && (currentAnswer == userSelectedAnswer) {
                return Color.red
            } else {
                return Color(red:0.6, green: 0.6, blue: 0.6)
            }
        default:
            return Color(red: 0.6, green: 0.6, blue: 0.6)
        }
    }
}
