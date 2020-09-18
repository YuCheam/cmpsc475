//
//  Multiplication.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct Problem: View {
    @Binding var skillsModel: SkillsModel
    
    var numberOne: Int { skillsModel.numberOne}
    var numberTwo: Int { skillsModel.numberTwo }
    var answers: [Int] {skillsModel.answers}
    var currentQuestion: Int {skillsModel.currentQuestion + 1}
    
    var symbol: String {skillsModel.symbol}
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Problem \(currentQuestion)").font(.headline)
            
            Text("\(numberOne)")
            
            HStack {
                Text(symbol)
                Text("\(numberTwo)")
            }
            
            Rectangle().frame(width: ViewConstants.multiplicationWidth, height: 5)
        }.font(.system(size: 55))
    }
}
