//
//  QuestionNumber.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/10/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct QuestionNumber: View {
    var index: Int
    let questionsAnswered : [AnswerState]
    var answerState: AnswerState {
        questionsAnswered.count == 0 ? .unknown : questionsAnswered[index]
    }
    
    var body: some View {
        Text("\(index+1)").overlay(
            Circle()
                .stroke(Color.questionNumberBackground(answerState: answerState), lineWidth: 2)
                .frame(width:50, height:50))
            .foregroundColor(Color.questionNumberBackground(answerState: answerState))
            .frame(width:50, height:50)
            .font(.system(size: 16, weight: .bold))
    }
    
    init(index: Int, questionsAnswered: [AnswerState]) {
        self.index = index
        self.questionsAnswered = questionsAnswered
    }
}
