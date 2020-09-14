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
        var total: Int = 0
        for question in questionsAnswered {
            if question == .correct { total += 1 }
        }
        return total
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                ForEach(0..<totalQuestions) {index in
                    QuestionNumber(index: index, questionsAnswered: self.questionsAnswered)
                }
            }.padding(10)
            
            Text("You got \(totalCorrect) out of 5 correct!")
        }
    }
    
    init(totalQuestions: Int, questionsAnswered: [AnswerState]) {
        self.totalQuestions = totalQuestions
        self.questionsAnswered = questionsAnswered
    }
}


struct UserProgress_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SkillsViewModel())
    }
}
