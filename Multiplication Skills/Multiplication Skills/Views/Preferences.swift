//
//  Preferences.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/15/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct Preferences: View {
    @Binding var totalQuestions: Int
    @Binding var difficultySettings: DifficultySettings
    @Binding var isShowingPreferenceView: Bool
    @Binding var gameState: GameState
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Arithmetic Type")) {
                    Picker("Arithmetic Type", selection: $difficultySettings.currentArithmetic) {
                        Text("Addition").tag(Arithmetic.addition)
                        Text("Multiplication").tag(Arithmetic.multiplication)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Difficulty")) {
                    Picker("Difficulty", selection: $difficultySettings.currentDifficulty) {
                        Text("Easy").tag(Difficulty.easy)
                        Text("Medium").tag(Difficulty.medium)
                        Text("Hard").tag(Difficulty.hard)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Number of Questions")) {
                    Stepper("\(totalQuestions)", value: $totalQuestions, in: 3...7)
                }
                Section() {
                    Button("Dismiss"){
                        self.isShowingPreferenceView.toggle()
                    }
                }
            }
        }.navigationBarTitle("Preferences")
    }
}

struct Preferences_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
