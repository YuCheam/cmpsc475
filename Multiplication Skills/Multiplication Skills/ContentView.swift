//
//  ContentView.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 8/30/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            userProgress()
            multiplication(numberOne: 12, numberTwo: 13)
            answers()
        }
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
    var sampleAnswers : [Int] = [1,2,3,4,5]
    
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
}
