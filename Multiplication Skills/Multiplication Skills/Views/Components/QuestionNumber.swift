//
//  QuestionNumber.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/10/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct QuestionNumber: View {
    let answerState: AnswerState
    var symbol: String {
        switch answerState {
        case .correct:
            return "✓"
        case .incorrect:
            return "𝖷"
        default:
            return ""
        }
    }
    
    var body: some View {
        Text("\(symbol)").overlay(
            Circle()
                .stroke(Color.questionNumberBackground(answerState: answerState), lineWidth: 2)
                .frame(width:50, height:50))
            .foregroundColor(Color.questionNumberBackground(answerState: answerState))
            .frame(width:50, height:50)
            .font(.system(size: 16, weight: .bold))
    }
    
}
