//
//  AdditionProblems.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/17/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

struct AdditionProblem {
    let totalAnswers: Int
    
    let firstAdddend: Int
    let secondAddend: Int
    let correctAnswer: Int
    
    var answers: [Int] = Array()
    
    mutating func generateAnswers(_ correctAnswer: Int) {
        let answerStartRange: Int = correctAnswer - 5 <= 1 ? 1 : correctAnswer - 5
        let answerEndRange: Int = correctAnswer + 5
        
        for _ in 0..<totalAnswers-1 {
            var temp: Int = Int.random(in: answerStartRange...answerEndRange)
            
            // Check for duplicate value
            while self.answers.contains(temp) || (temp == correctAnswer) {
                temp = Int.random(in: answerStartRange...answerEndRange)
            }
            
            self.answers.append(temp)
        }
        
        // Inject correct answer
        self.answers.insert(correctAnswer, at: Int.random(in: 0...totalAnswers-2))
    }
    
    init(startRange: Int, endRange: Int, totalAnswers: Int) {
        self.totalAnswers = totalAnswers
        
        self.firstAdddend = Int.random(in: startRange...endRange)
        self.secondAddend = Int.random(in: startRange...endRange)
        self.correctAnswer = firstAdddend + secondAddend
        
        generateAnswers(self.correctAnswer)
    }
}
