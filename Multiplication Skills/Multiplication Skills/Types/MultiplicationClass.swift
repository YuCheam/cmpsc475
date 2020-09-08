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
    
    func generateRandomNumbers(_ startRange: Int, _ endRange: Int) -> Int {
        return Int.random(in: startRange...endRange)
    }
    
    func generateAnswers() -> [Int] {
        var tempArray: [Int] = Array()
        let answer: Int = multiplicand * multiplier
        let answerStartRange: Int = answer - 5 <= 1 ? 1 : answer - 5
        let answerEndRange: Int = answer + 5
        
        for _ in 0..<totalAnswers-1 {
            tempArray.append(Int.random(in: answerStartRange...answerEndRange))
        }
        
        // Inject correct answer
        tempArray.insert(answer, at: Int.random(in: 0...totalAnswers-2))
        
        return tempArray
    }
    
    init(_ startRange: Int, _ endRange: Int, _ totalAnswers: Int) {
        self.startRange = startRange
        self.endRange = endRange
        self.totalAnswers = totalAnswers
    }
}
