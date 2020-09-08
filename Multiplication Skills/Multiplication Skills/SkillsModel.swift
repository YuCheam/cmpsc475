//
//  SkillsModel.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

enum State {
    case start, multiply, restart
}

enum AnswerState {
    case correct, incorrect, unknown
}

struct SkillsModel {
    var gameState: State = .start
    var buttonLabel: String {
        switch gameState {
        case .start:
            return "Start"
        case .multiply:
            return "Next"
        default:
            return "Restart"
        }
    }
    
    mutating func advanceGameState() {
        switch gameState {
        case .start:
            generateNewProblemSet()
            gameState = .multiply
        case .multiply:
            gameState = currentQuestion + 1 == totalQuestions ? .restart : .multiply
            currentQuestion += 1 // Change to next question
        case .restart:
            gameState = .start
            currentQuestion = 0
        }
    }
    
    let totalQuestions: Int = 5
    let totalAnswers: Int = 4
    
    var questionsAnswered: [AnswerState] {Array(repeating: .unknown, count: totalQuestions)}
    var currentQuestion: Int = 0
    var totalCorrect: Int {
        var total: Int = 0
        for question in questionsAnswered {
            if question == .correct { total += 1 }
        }
        return total
    }
    
    
    // Generate Multiplication Problems
    let startRange: Int = 1
    let endRange: Int = 15
    let symbol: String = "x"
    var multiplicationProblems: [MultiplicationClass] = Array()
    
    mutating func generateNewProblemSet() {
        multiplicationProblems.removeAll()
        for _ in 0..<totalQuestions {
            multiplicationProblems.append(MultiplicationClass(startRange, endRange, totalAnswers))
        }
    }
    
    var multiplicand: Int {
        switch gameState {
        case .start, .restart:
            return 0
        default:
            return multiplicationProblems[currentQuestion].multiplicand
        }
    }
    
    var multiplier: Int {
        switch gameState {
        case .start, .restart:
            return 0
        default:
            return multiplicationProblems[currentQuestion].multiplier
        }
    }
    
    var answers: [Int] {
        switch gameState {
        case .start, .restart:
            return []
        default:
            return multiplicationProblems[currentQuestion].answers
        }
    }
    
}
