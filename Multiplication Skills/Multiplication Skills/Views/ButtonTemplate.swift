//
//  NextButton.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct ButtonTemplate: View {
    @EnvironmentObject var skillsViewModel: SkillsViewModel
    
    var body: some View {
        Button(skillsViewModel.buttonLabel){
            self.skillsViewModel.advanceGameState()
        }
        .padding(.vertical, 10.0)
        .padding(.horizontal, 20)
        .font(.system(size:24, weight: .semibold))
        .background(ViewConstants.defaultButtonColor)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
    
}
