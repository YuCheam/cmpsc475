//
//  ContentView.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 8/30/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var skillsViewModel = SkillsViewModel()
    
    var body: some View {
        ZStack {
            Color(ViewConstants.backgroundColor)
            
            VStack(spacing: 30) {
                Text("Multiplication Skills")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                VStack(spacing: 40) {
                    UserProgress()
                    Multiplication()
                    Answers().disabled(disableAnswers)
                }.opacity(showProblem).padding(10).background(Color.white)
                
                ButtonTemplate().opacity(showNextButton)
            }
            
        }.edgesIgnoringSafeArea(.all)
        .environmentObject(skillsViewModel)
    }
    
    var showProblem: Double {
        switch skillsViewModel.gameState {
        case .start:
            return 0.0
        default:
            return 1.0
        }
    }
    
    var showNextButton: Double {
        skillsViewModel.gameState == .multiply ? 0.0 : 1.0
    }
    
    var disableAnswers: Bool {
        return skillsViewModel.gameState == .next || skillsViewModel.gameState == .restart
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SkillsViewModel())
    }
}

