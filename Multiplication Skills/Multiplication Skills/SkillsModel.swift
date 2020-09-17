//
//  SkillsModel.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

enum GameState {
    case start, multiply, next, restart
}

enum AnswerState {
    case correct, incorrect, unknown
}

enum Difficulty: String {
    case easy, medium, hard
    
    var id: String {self.rawValue}
}

enum Arithmetic: String {
    case multiplication, addition
    
    var id: String {self.rawValue}
}

struct SkillsModel {
    var gameState: GameState = .start
    var currentQuestion: Int = 0
    var totalQuestions: Int = 5
    let totalAnswers: Int = 4
    
    mutating func advanceGameState() {
        switch gameState {
        case .start:
            generateNewProblemSet()
            gameState = .multiply
        case .multiply:
            gameState = currentQuestion + 1 == totalQuestions ? .restart : .next
        case .restart:
            generateNewProblemSet()
            gameState = .multiply
            currentQuestion = 0
        default: // .next
            gameState = .multiply
            currentQuestion += 1  // Change to next question
        }
    }
    
    var selectedAnswer: Int = 0
    mutating func checkCorrectGuess(guess: Int) {
        let correctAnswer: Int = multiplicationProblems[currentQuestion].correctAnswer
        selectedAnswer = guess
        
        if correctAnswer == guess {
            questionsAnswered[currentQuestion] = .correct
            // Correct Answer
        } else {
            questionsAnswered[currentQuestion] = .incorrect
            // Wrong answer
        }
        
        advanceGameState()
    }
    
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
    
    // Generate Multiplication Problems and AnswerStates
    var difficultySettings = DifficultySettings()
    var startRange: Int {difficultySettings.startRange}
    var endRange: Int {difficultySettings.endRange}
    let symbol: String = "+"
    var multiplicationProblems: [MultiplicationProblem] = Array()
    var questionsAnswered: [AnswerState] = Array()
    
    mutating func generateNewProblemSet() {
        multiplicationProblems.removeAll() // Clear out old problem set
        questionsAnswered.removeAll()
        
        for _ in 0..<totalQuestions {
            multiplicationProblems.append(MultiplicationProblem(startRange, endRange, totalAnswers))
            //additionProblems.append(additionProblems(startRange, endRange, totalAnswers))
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
        return multiplicationProblems[currentQuestion].multiplier
    }
    
    var answers: [Int] {
        switch gameState {
        case .start:
            return []
        default:
            return multiplicationProblems[currentQuestion].answers
        }
    }
    
    var correctAnswer: Int {
        switch gameState {
        case .start:
            return 0
        default:
            return multiplicationProblems[currentQuestion].correctAnswer
        }
    }
}
