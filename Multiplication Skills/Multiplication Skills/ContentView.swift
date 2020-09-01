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
        ZStack {
            Color(red: 0.75, green: 1, blue: 1)
            
            VStack(spacing: 30) {
                Text("Multiplication Skills")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                VStack(spacing: 40) {
                    userProgress()
                    multiplication(numberOne: 17, numberTwo: 8)
                    answers([175, 178,172,170])
                }.padding(10).background(Color.white)
                
                nextButton().hidden()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct userProgress: View {
    let totalQuestions: [Color] = [Color.green, Color.green, Color.red, Color.black, Color.black]
    let totalCorrect: Int = 2
    let totalIncorrect: Int = 1

    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                ForEach(0..<totalQuestions.count) {index in
                    Text("\(index+1)").overlay(
                        Circle()
                            .strokeBorder(self.totalQuestions[index], lineWidth: 2)
                            .frame(width:50, height:50))
                        .frame(width:50, height:50).font(.system(size: 16, weight: .bold))
                        .foregroundColor(self.totalQuestions[index])
                }
            }.padding(10)
            
            Text("You got \(totalCorrect) out of 5 correct!")
        }
    }
}

struct multiplication: View {
    let numberOne: Int
    let numberTwo: Int
    let symbol: String
    let multiplicationWidth: CGFloat = 120
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Problem 4").font(.headline)
            
            Text("\(self.numberOne)")
            
            HStack {
                Text(symbol)
                Text("\(self.numberTwo)")
            }
            
            Rectangle().frame(width: multiplicationWidth, height: 5)
        }.font(.system(size: 55))
    }
    
    init(numberOne: Int, numberTwo: Int) {
        self.numberOne = numberOne
        self.numberTwo = numberTwo
        self.symbol = "x"
    }
}

struct answers: View {
    let sampleAnswers : [Int]
    
    var body: some View {
        HStack {
            ForEach(sampleAnswers, id: \.self) {answer in
                
                Button("\(answer)"){}
                    .frame(width: 65, height: 40)
                    .background(Color(red: 0.6, green: 0.6, blue: 0.6))
                    .foregroundColor(Color.black)
                    .cornerRadius(5)
                    .font(.system(size: 16, weight: .bold))
            }
        }.padding(10)
    }
    
    init(_ answerArray: [Int]) {
        self.sampleAnswers = answerArray
    }
}

struct nextButton: View {
    var body: some View {
        Button("Next") { }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 20)
            .font(.system(size:24, weight: .semibold))
            .background(Color(red: 0.6, green: 0.6, blue: 0.6))
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
