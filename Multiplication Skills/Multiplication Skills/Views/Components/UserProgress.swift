//
//  UserProgress.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct UserProgress: View {
    let totalQuestions: Int
    let questionsAnswered : [AnswerState]
    var totalCorrect: Int {
        questionsAnswered.filter{$0 == .correct}.count
    }
    
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                ForEach(questionsAnswered, id: \.self) {answerState in
                    QuestionNumber(answerState: answerState)
                }
            }.padding(10)
            
            Text("You got \(totalCorrect) out of \(questionsAnswered.count) correct!")
        }
    }
}


struct UserProgress_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
