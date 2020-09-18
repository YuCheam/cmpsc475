//
//  Multiplication.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct Problem: View {
    let difficultySettings: DifficultySettings
    let numberOne: Int
    let numberTwo: Int
    let answers: [Int]
    let currentQ: Int
    var currentQuestion: Int {currentQ + 1}
    var symbol: String {
        difficultySettings.currentArithmetic == .addition ? "+" : "x"
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Problem \(currentQuestion)").font(.headline)
            
            Text("\(numberOne)")
            
            HStack {
                Text(symbol)
                Text("\(numberTwo)")
            }
            
            Rectangle().frame(width: ViewConstants.multiplicationWidth, height: 5)
        }.font(.system(size: 55))
    }
}
