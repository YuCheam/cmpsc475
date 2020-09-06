//
//  UserProgress.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct UserProgress: View {
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

