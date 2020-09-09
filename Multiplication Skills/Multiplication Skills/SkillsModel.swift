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
    var gameState: State = .start
    var currentQuestion: Int = 0
    
    var buttonLabel: String {
        switch gameState {
        case .start:
            return "Start"
        case .next:
            return "Next"
        case .restart:
            return "Restart"
        default:
            return ""
        }
    }
    
    mutating func advanceGameState() {
        switch gameState {
        case .start:
            generateNewProblemSet()
            gameState = .multiply
        case .next:
            gameState = currentQuestion + 1 == totalQuestions ? .restart : .multiply
            currentQuestion += 1 // Change to next question
        case .restart:
            gameState = .start
            currentQuestion = 0
        default:
            return
        }
    }
    
    mutating func guessedAnswer(guess: Int) {
        let correctAnswer: Int = multiplicationProblems[currentQuestion].correctAnswer
        if correctAnswer == guess {
            gameState = .next
            questionsAnswered[currentQuestion] = .correct
            // Correct Answer
        } else {
            gameState = .next
            questionsAnswered[currentQuestion] = .incorrect
            // Wrong answer
        }
    }
    
    let totalQuestions: Int = 5
    let totalAnswers: Int = 4
    
    
    // Generate Multiplication Problems and AnswerStates
    let startRange: Int = 1
    let endRange: Int = 15
    let symbol: String = "x"
    var multiplicationProblems: [MultiplicationClass] = Array()
    var questionsAnswered: [AnswerState] = Array()
    
    mutating func generateNewProblemSet() {
        multiplicationProblems.removeAll() // Clear out old problem set
        questionsAnswered.removeAll()
        
        for _ in 0..<totalQuestions {
            multiplicationProblems.append(MultiplicationClass(startRange, endRange, totalAnswers))
            questionsAnswered.append(.unknown)
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
