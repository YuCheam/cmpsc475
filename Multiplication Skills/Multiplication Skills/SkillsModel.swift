//
//  SkillsModel.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

enum State {
    case start, multiply, next, restart
}

enum AnswerState {
    case correct, incorrect, unknown
}

struct SkillsModel {
    
    let totalQuestions: Int = 5
    
    var questionsAnswered: [AnswerState] {Array(repeating: .unknown, count: totalQuestions)}
    var currentRound: Int = 0
    var totalCorrect: Int {
        var total: Int = 0
        for question in questionsAnswered {
            if question == .correct { total += 1 }
        }
        return total
    }
    
    mutating func displayColor() {
        
    }
}
