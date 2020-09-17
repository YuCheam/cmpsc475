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
    @Binding var isShowingPreferenceView: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Arithmetic Type")) {
                    Text("Arithmetic Stuff Goes here")
                }
                
                Section(header: Text("Difficulty")) {
                    Text("Difficulty stuff goes here")
                }
                
                Section(header: Text("Number of Questions")) {
                    Stepper("\(totalQuestions)", value: $totalQuestions, in: 3...7)
                }
                Section() {
                    Button("Dismiss"){self.isShowingPreferenceView.toggle()}
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
