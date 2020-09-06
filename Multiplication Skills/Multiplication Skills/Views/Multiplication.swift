//
//  Multiplication.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct Multiplication: View {
    @EnvironmentObject var skillsViewModel: SkillsViewModel
    
    var numberOne: Int {skillsViewModel.multiplicand}
    var numberTwo: Int {skillsViewModel.multiplier}
    var answers: [Int] {skillsViewModel.answers}
    var currentQuestion: Int {skillsViewModel.currentQuestion + 1}
    
    var symbol: String {skillsViewModel.symbol}
    let multiplicationWidth: CGFloat = 120
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Problem \(currentQuestion)").font(.headline)
            
            Text("\(numberOne)")
            
            HStack {
                Text(symbol)
                Text("\(numberTwo)")
            }
            
            Rectangle().frame(width: multiplicationWidth, height: 5)
        }.font(.system(size: 55))
    }
    
}

struct Multiplication_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SkillsViewModel())
    }
}
