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
        NavigationView {
            ZStack {
                Color(ViewConstants.backgroundColor)
                VStack(spacing: 10) {
                    Text("Multiplication Skills")
                    .font(ViewConstants.titleFont)
                    .fontWeight(.heavy)
                    .padding(20)
                    
                    Text("Tap the start button to test your skills if you dare....")
                        .font(ViewConstants.titleFont)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 60.0)
                    
                    Image("dareYou")
                        .scaleEffect(0.7)
                        .frame(width: 200, height: 246)
                    
                    NavigationLink(destination: GameRootView(skillsViewModel: skillsViewModel)) {
                        Text("Start").padding(.vertical, 10.0)
                            .padding(.horizontal, 20)
                            .font(.system(size:24, weight: .semibold))
                            .background(ViewConstants.defaultButtonColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.simultaneousGesture(TapGesture().onEnded({
                        self.skillsViewModel.advanceGameState()
                    }))
                    
                }
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct GameRootView: View {
    @ObservedObject var skillsViewModel : SkillsViewModel
    
    var body: some View {
        ZStack {
            Color(ViewConstants.backgroundColor)
                    VStack(spacing: 20) {
                        Text("Multiplication Skills")
                            .font(ViewConstants.titleFont)
                            .fontWeight(.heavy)
                            .padding(20)
            
                        VStack(spacing: 40) {
                            UserProgress()
                            Multiplication()
                            Answers().disabled(disableAnswers)
                        }.padding(10)
                            .background(ViewConstants.secondaryBackground)
                        
                        ButtonTemplate().opacity(showNextButton)
                    }.environmentObject(skillsViewModel)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
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

