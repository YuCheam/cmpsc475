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
    var correctAnswer: Int {skillsViewModel.correctAnswer}
    
    var body: some View {
        HStack {
            ForEach(answers, id: \.self) {answer in
                
                Button("\(answer)"){
                    self.skillsViewModel.checkCorrectGuess(guess: answer)
                }
                .frame(width: 65, height: 40)
                .background(Color.answerButtonBackground(
                    state: self.skillsViewModel.gameState, select: self.skillsViewModel.selectedAnswer, currentAnswer: answer, correctAnswer: self.correctAnswer))
                    .foregroundColor(Color.black)
                    .cornerRadius(5)
                    .font(.system(size: 16, weight: .bold))
            }
        }.padding(10)
    }
}

struct Answers_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
