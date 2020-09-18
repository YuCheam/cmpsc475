//
//  PreferenceButton.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/15/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct PreferenceButton: View {
    @Binding var skillsModel : SkillsModel
    @State private var isShowingPreferenceView: Bool = false
    
    var body: some View {
        Button(action: { self.isShowingPreferenceView.toggle() }){
            Text("⚙️")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }.sheet(isPresented: self.$isShowingPreferenceView) {
            Preferences(totalQuestions: self.$skillsModel.totalQuestions, difficultySettings: self.$skillsModel.difficultySettings, isShowingPreferenceView: self.$isShowingPreferenceView,
                gameState: self.$skillsModel.gameState)
        }
    }
}


struct PreferenceButton_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
