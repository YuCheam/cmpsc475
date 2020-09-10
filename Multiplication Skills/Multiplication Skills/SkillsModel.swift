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
            return "Next"
        }
    }
    
    mutating func advanceGameState() {
        switch gameState {
        case .start:
            generateNewProblemSet()
            gameState = .multiply
        case .multiply:
            gameState = currentQuestion + 1 == totalQuestions ? .restart : .next
        case .restart:
            gameState = .start
            currentQuestion = 0
        default: // .next
            gameState = .multiply
            currentQuestion += 1  // Change to next question
            return
        }
    }
    
    mutating func checkCorrectGuess(guess: Int) {
        let correctAnswer: Int = multiplicationProblems[currentQuestion].correctAnswer
        if correctAnswer == guess {
            questionsAnswered[currentQuestion] = .correct
            // Correct Answer
        } else {
            questionsAnswered[currentQuestion] = .incorrect
            // Wrong answer
        }
        
        advanceGameState()
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
        case .start:
            return 0
        default:
            return multiplicationProblems[currentQuestion].multiplicand
        }
    }
    
    var multiplier: Int {
        switch gameState {
        case .start:
            return 0
        default:
            return multiplicationProblems[currentQuestion].multiplier
        }
    }
    
    var answers: [Int] {
        switch gameState {
        case .start:
            return []
        default:
            return multiplicationProblems[currentQuestion].answers
        }
    }
    
}
