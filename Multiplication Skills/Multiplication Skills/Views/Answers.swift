//
//  Answers.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct Answers: View {
    @EnvironmentObject var skillsViewModel: SkillsViewModel
    var answers : [Int] {skillsViewModel.answers}
    
    var body: some View {
        HStack {
            ForEach(answers, id: \.self) {answer in
                
                Button("\(answer)"){
                    self.skillsViewModel.guessedAnswer(guess: answer)
                }
                    .frame(width: 65, height: 40)
                    .background(Color(red: 0.6, green: 0.6, blue: 0.6))
                    .foregroundColor(Color.black)
                    .cornerRadius(5)
                    .font(.system(size: 16, weight: .bold))
            }
        }.padding(10)
    }
}
