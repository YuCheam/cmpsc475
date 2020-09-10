//
//  QuestionNumber.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/10/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct QuestionNumber: View {
    @EnvironmentObject var skillsViewModel: SkillsViewModel
    var index: Int
    var answerState: AnswerState {skillsViewModel.getAnswerState(question: index)}
    
    var body: some View {
        Text("\(index+1)").overlay(
            Circle()
                .stroke(Color.questionNumberBackground(answerState: answerState), lineWidth: 2)
                .frame(width:50, height:50))
            .foregroundColor(Color.questionNumberBackground(answerState: answerState))
            .frame(width:50, height:50)
            .font(.system(size: 16, weight: .bold))
    }
}
