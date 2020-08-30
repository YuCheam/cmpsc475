//
//  ContentView.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 8/30/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

func generateSecondNumber(uniqueNum: Int) -> Int {
    var number: Int = Int.random(in:1...15)
    while number == uniqueNum {
        number = Int.random(in:1...15)
    }
    
    return number
}

func generateAnswers(correctAnswer: Int) -> [Int] {
    var array = [Int]()
    let topLimit: Int = correctAnswer + 5
    var bottomLimit: Int = correctAnswer - 5
    
    if bottomLimit < 0 { bottomLimit = 0 }
    var number = Int.random(in:bottomLimit...topLimit)
    
    array.append(Int.random(in:bottomLimit...topLimit))
    
    while array.count < 4 {
        if !array.contains(number) && !array.contains(correctAnswer) {
            array.append(number)
        }
        
        number = Int.random(in:bottomLimit...topLimit)
    }
    
    array.insert(correctAnswer, at: Int.random(in:0..<4))
    
    return array
}

struct ContentView: View {
//    let multipliers: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    var numberOne: Int
    var numberTwo: Int
    var answer: Int
    var answerArray: [Int]
    
    
    var body: some View {
        VStack(spacing: 50) {
            userProgress()
            multiplication(numberOne: numberOne, numberTwo: numberTwo)
            answers(answerArray)
        }
    }
    
    init() {
        self.numberOne = Int.random(in:1...15)
        self.numberTwo = generateSecondNumber(uniqueNum: self.numberOne)
        self.answer = self.numberOne * self.numberTwo
        self.answerArray = generateAnswers(correctAnswer: self.answer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct userProgress: View {
    let totalQuestions: Int = 5
    var totalCorrect: Int = 0
    var totalIncorrect: Int = 0
    
    var body: some View {
        HStack {
            ForEach(0..<totalQuestions) {circle in
                Circle().frame(width: 16, height: 16)
            }
        }
    }
}

struct multiplication: View {
    let numberOne: Int
    let numberTwo: Int
    var symbol: String
    let multiplicationWidth: CGFloat = 100
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("\(self.numberOne)")
            
            HStack {
                Text(symbol)
                Text("\(self.numberTwo)")
            }
            
            Rectangle().frame(width: multiplicationWidth, height: 2)
        }.font(.largeTitle)
    }
    
    init(numberOne: Int, numberTwo: Int) {
        self.numberOne = numberOne
        self.numberTwo = numberTwo
        self.symbol = "x"
    }
}

struct answers: View {
    var sampleAnswers : [Int]
    
    var body: some View {
        HStack {
            ForEach(0..<sampleAnswers.count) { answer in
                Button("\(answer)"){}
                .frame(width: 50, height: 30)
                .background(Color.yellow)
                .cornerRadius(5)
            }
        }
    }
    
    init(_ answerArray: [Int]) {
        self.sampleAnswers = answerArray
    }
}
