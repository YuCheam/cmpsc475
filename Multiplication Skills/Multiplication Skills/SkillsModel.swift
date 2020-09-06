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
    
    // Generate Numbers for Multiplication Problems
    let startRange: Int = 1
    let endRange: Int = 15
    let symbol: String = "x"
    
    var multiplicands: [Int] {
        var array: [Int] = Array()
        for _ in 0..<totalQuestions {
            array.append(Int.random(in: startRange...endRange))
        }
        return array
    }
    
    var multipliers: [Int] {
        var array: [Int] = Array()
        for _ in 0..<totalQuestions {
            array.append(Int.random(in: startRange...endRange))
        }
        return array
    }
    
    var answers: [[Int]] {
        var returnArray: [[Int]] = Array()
        var tempArray: [Int] = Array()
        var answer: Int
        var startRange: Int
        var endRange: Int
        
        for index in 0..<totalQuestions {
            answer = multipliers[index] * multiplicands[index]
            startRange = answer - 5 <= 0 ? 1 : answer-5
            endRange = answer + 5
            
            for _ in 0..<totalAnswers-1 {
                tempArray.append(Int.random(in: startRange...endRange))
            }
            
            // Inject correct answer
            tempArray.insert(answer, at: Int.random(in: 0...totalAnswers-2))
            
            returnArray[index] = tempArray
        }
        
        return returnArray
    }
    
    var currentMultiplicand: Int {multiplicands[currentQuestion]}
    var currentMultiplier: Int {multipliers[currentQuestion]}
    var currentAnswers: [Int] {answers[currentQuestion]}
}
