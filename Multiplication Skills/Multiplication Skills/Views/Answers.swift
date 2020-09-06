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
    let sampleAnswers : [Int]
    
    var body: some View {
        HStack {
            ForEach(sampleAnswers, id: \.self) {answer in
                
                Button("\(answer)"){}
                    .frame(width: 65, height: 40)
                    .background(Color(red: 0.6, green: 0.6, blue: 0.6))
                    .foregroundColor(Color.black)
                    .cornerRadius(5)
                    .font(.system(size: 16, weight: .bold))
            }
        }.padding(10)
    }
    
    init(_ answerArray: [Int]) {
        self.sampleAnswers = answerArray
    }
}
