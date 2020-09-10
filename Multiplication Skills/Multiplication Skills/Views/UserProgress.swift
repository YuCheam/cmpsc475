//
//  UserProgress.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct UserProgress: View {
    @EnvironmentObject var skillsViewModel: SkillsViewModel
    
    var totalQuestions: Int {skillsViewModel.totalQuestions}
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                ForEach(0..<totalQuestions) {index in
                    QuestionNumber(index: index)
                }
            }.padding(10)
            
            Text("You got \(skillsViewModel.totalCorrect) out of 5 correct!")
        }
    }
    
}


struct UserProgress_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SkillsViewModel())
    }
}
