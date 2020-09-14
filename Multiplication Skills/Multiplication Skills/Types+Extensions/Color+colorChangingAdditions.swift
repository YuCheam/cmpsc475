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
    static func answerButtonBackground(
        state: GameState, select userSelectedAnswer: Int, currentAnswer: Int, correctAnswer: Int
    ) -> Color {
        switch state {
        case .next, .restart:
            if (currentAnswer == correctAnswer) {
                return ViewConstants.correctColor
            } else if (currentAnswer != correctAnswer) && (currentAnswer == userSelectedAnswer) {
                // User selected the wrong answer
                return ViewConstants.incorrectColor
            } else {
                return ViewConstants.defaultButtonColor
            }
        default:
            return ViewConstants.defaultButtonColor
        }
    }
    
    static func questionNumberBackground(answerState state: AnswerState) -> Color {
        switch state{
        case .correct:
            return ViewConstants.correctColor
        case .incorrect:
            return ViewConstants.incorrectColor
        default:
            return ViewConstants.unknownColor
        }
    }
}
