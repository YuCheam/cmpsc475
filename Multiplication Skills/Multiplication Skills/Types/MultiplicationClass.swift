//
//  MultiplicationClass.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/6/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

class MultiplicationClass {
    let answerRange: Int = 5
    var startRange: Int
    var endRange: Int
    var totalAnswers: Int
    
    lazy var multiplicand: Int = Int.random(in: startRange...endRange)
    lazy var multiplier: Int = Int.random(in: startRange...endRange)
    lazy var answers: [Int] = generateAnswers()
    lazy var correctAnswer: Int = multiplicand * multiplier
    
    func generateRandomNumbers(_ startRange: Int, _ endRange: Int) -> Int {
        return Int.random(in: startRange...endRange)
    }
    
    func generateAnswers() -> [Int] {
        var tempArray: [Int] = Array()
        let answerStartRange: Int = correctAnswer - 5 <= 1 ? 1 : correctAnswer - 5
        let answerEndRange: Int = correctAnswer + 5
        
        for _ in 0..<totalAnswers-1 {
            var temp: Int = Int.random(in: answerStartRange...answerEndRange)
            
            // Don't add duplicate value
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
        self.startRange = startRange
        self.endRange = endRange
        self.totalAnswers = totalAnswers
    }
}
