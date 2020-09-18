//
//  NextButton.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct ButtonTemplate: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var skillsModel: SkillsModel
    var isRestart: Bool {skillsModel.gameState == .restart ? true : false}
    
    var body: some View {
        Button(action: {
            if self.isRestart { self.presentationMode.wrappedValue.dismiss() }
            self.skillsModel.advanceGameState()
        }){
            Text("\(skillsModel.buttonLabel)").padding(.vertical, 10.0)
            .padding(.horizontal, 20)
            .font(.system(size:24, weight: .semibold))
            .background(ViewConstants.defaultButtonColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
    }
    
}
