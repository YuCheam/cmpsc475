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

enum Difficulty: String, Identifiable {
    case easy, medium, hard
    
    var id: String {self.rawValue.capitalized}
}

enum Arithmetic: String, Identifiable {
    case multiplication, addition
    
    var id: String {self.rawValue.capitalized}
}

struct SkillsModel {
    var gameState: GameState = .start
    var currentQuestion: Int = 0
    var totalQuestions: Int = 5 {
        didSet {
            switch gameState{
            case .start:
                generateNewProblemSet()
            default:
                currentQuestion = 0
                generateNewProblemSet()
                gameState = .multiply
            }
        }
    }

    let totalAnswers: Int = 4
    
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
        }
    }
    
    var selectedAnswer: Int = 0
    mutating func checkCorrectGuess(guess: Int) {
        let correctAnswer: Int = difficultySettings.currentArithmetic == .addition ? additionProblems[currentQuestion].correctAnswer : multiplicationProblems[currentQuestion].correctAnswer
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
    var difficultySettings = DifficultySettings() {
        didSet {
            generateNewProblemSet()
            currentQuestion = 0
            gameState = gameState == .start ? .start : .multiply // restart only if progress
        }
    }
    var startRange: Int {difficultySettings.startRange}
    var endRange: Int {difficultySettings.endRange}
    var additionProblems: [AdditionProblem] = Array()
    var multiplicationProblems: [MultiplicationProblem] = Array()
    var questionsAnswered: [AnswerState] = Array()
    
    mutating func generateNewProblemSet() {
        multiplicationProblems.removeAll()
        questionsAnswered.removeAll()
        additionProblems.removeAll()
        
        for _ in 0..<totalQuestions {
            difficultySettings.currentArithmetic == .addition ? additionProblems.append(AdditionProblem(startRange: startRange, endRange: endRange, totalAnswers: totalAnswers)) : multiplicationProblems.append(MultiplicationProblem(startRange, endRange, totalAnswers))
            questionsAnswered.append(.unknown)
        }
    }
    
    var numberOne: Int {
        switch difficultySettings.currentArithmetic {
        case .addition:
            return additionProblems[currentQuestion].firstAdddend
        default: // multiplication
            return multiplicationProblems[currentQuestion].multiplicand
        }
    }
    
    var numberTwo: Int {
        switch difficultySettings.currentArithmetic {
        case .addition:
            return additionProblems[currentQuestion].secondAddend
        default: // multiplication
            return multiplicationProblems[currentQuestion].multiplier
        }
    }

    
    var answers: [Int] {
        switch difficultySettings.currentArithmetic {
        case .addition:
            return additionProblems[currentQuestion].answers
        default: // multiplication
            return multiplicationProblems[currentQuestion].answers
        }
    }
    
    var correctAnswer: Int {
        switch difficultySettings.currentArithmetic {
        case .addition:
            return additionProblems[currentQuestion].correctAnswer
        default: // multiplication
            return multiplicationProblems[currentQuestion].correctAnswer
        }
    }
}
