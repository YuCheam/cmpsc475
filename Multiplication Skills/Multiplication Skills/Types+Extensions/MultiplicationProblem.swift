//
//  MultiplicationClass.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/6/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

struct MultiplicationProblem {
    let totalAnswers: Int
    let answerRange: Int = 5 // Amount by which answers can vary
    
    let multiplicand: Int
    let multiplier: Int
    let correctAnswer: Int
    var answers: [Int] = Array()
    
    mutating func generateAnswers(_ correctAnswer: Int) {
        let answerStartRange: Int = correctAnswer - 5 <= 1 ? 1 : correctAnswer - 5
        let answerEndRange: Int = correctAnswer + 5
        
        for _ in 0..<totalAnswers-1 {
            var temp: Int = Int.random(in: answerStartRange...answerEndRange)
            
            // Check for duplicate value
            while answers.contains(temp) || (temp == correctAnswer) {
                temp = Int.random(in: answerStartRange...answerEndRange)
            }
            
            answers.append(temp)
        }
        
        // Inject correct answer
        answers.insert(correctAnswer, at: Int.random(in: 0...totalAnswers-2))
    }
    
    init(_ startRange: Int, _ endRange: Int, _ totalAnswers: Int) {
        self.totalAnswers = totalAnswers
        
        self.multiplicand = Int.random(in: startRange...endRange)
        self.multiplier = Int.random(in: startRange...endRange)
        self.correctAnswer = multiplicand * multiplier
        generateAnswers(self.correctAnswer)
    }
}
