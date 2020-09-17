//
//  MultiplicationClass.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/6/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

class MultiplicationProblem {
    let answerRange: Int = 5 // Amount by which answers can vary
    
    var multiplicand: Int
    var multiplier: Int
    var correctAnswer: Int
    var totalAnswers: Int
    lazy var answers: [Int] = generateAnswers()
    
    func generateAnswers() -> [Int] {
        var tempArray: [Int] = Array()
        let answerStartRange: Int = correctAnswer - 5 <= 1 ? 1 : correctAnswer - 5
        let answerEndRange: Int = correctAnswer + 5
        
        for _ in 0..<totalAnswers-1 {
            var temp: Int = Int.random(in: answerStartRange...answerEndRange)
            
            // Check for duplicate value
            while tempArray.contains(temp) || (temp == correctAnswer) {
                temp = Int.random(in: answerStartRange...answerEndRange)
            }
            
            tempArray.append(temp)
        }
        
        // Inject correct answer
        tempArray.insert(correctAnswer, at: Int.random(in: 0...totalAnswers-2))
        
        return tempArray
    }
    
    init(_ startRange: Int, _ endRange: Int, _ totalAnswers: Int) {
        self.multiplicand = Int.random(in: startRange...endRange)
        self.multiplier = Int.random(in: startRange...endRange)
        self.correctAnswer = multiplicand * multiplier
        self.totalAnswers = totalAnswers
    }
}
