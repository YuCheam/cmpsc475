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
    @State private var isShowingPreferenceView = false
    
    var body: some View {
        Button("Preferences", action: { self.isShowingPreferenceView.toggle() }).padding(.vertical, 10.0)
            .padding(.horizontal, 20)
            .font(.system(size:24, weight: .semibold))
            .background(ViewConstants.defaultButtonColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .sheet(isPresented: $isShowingPreferenceView) {
                Preferences(skillsModel: self.$skillsModel, isShowingPreferenceView: self.$isShowingPreferenceView)
        }
    }
}


struct PreferenceButton_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
