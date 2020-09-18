//
//  ContentView.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 8/30/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var skillsModel : SkillsModel = SkillsModel()
    
    var body: some View {
        NavigationView {
            ZStack() {
                Color(ViewConstants.backgroundColor)
                
                VStack(spacing: 10) {
                    Text("\(skillsModel.difficultySettings.currentArithmetic.id) skills")
                        .font(ViewConstants.titleFont)
                        .fontWeight(.heavy)
                    
                    Text("Tap the start button to test your skills if you dare....")
                        .font(ViewConstants.titleFont)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 60.0)
                    
                    Image("dareYou")
                        .scaleEffect(0.7)
                        .frame(width: 200, height: 246)
                    
                    HStack {
                        NavigationLink(destination: GameRootView(skillsModel: $skillsModel)) {
                            Text("Start").padding(.vertical, 10.0)
                                .padding(.horizontal, 20)
                                .font(.system(size:24, weight: .semibold))
                                .background(ViewConstants.defaultButtonColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.simultaneousGesture(TapGesture().onEnded({
                            self.skillsModel.advanceGameState()
                        }))
                        
                    }
                    
                    PreferenceButton(skillsModel: $skillsModel).alignmentGuide(HorizontalAlignment.center, computeValue: {d in
                        d[HorizontalAlignment.center] - 150 })
                        .offset(y: 20)
                }
                
            }.edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct GameRootView: View {
    @Binding var skillsModel : SkillsModel
    @State var isRestart = false
    
    var body: some View {
        ZStack {
            Color(ViewConstants.backgroundColor)

                    VStack(spacing: 10) {
                        VStack(spacing: 0) {
                            Text("\(skillsModel.difficultySettings.currentArithmetic.id) skills")
                            .font(ViewConstants.titleFont)
                            .fontWeight(.heavy)
                            
                            Text("\(skillsModel.difficultySettings.currentDifficulty.id)")
                                .frame(alignment: .leading)
                        }.padding(15)
            
                        VStack(spacing: 40) {
                            UserProgress(totalQuestions: skillsModel.totalQuestions, questionsAnswered: skillsModel.questionsAnswered)
                            Problem(difficultySettings: skillsModel.difficultySettings, numberOne: skillsModel.numberOne, numberTwo: skillsModel.numberTwo,answers: skillsModel.answers, currentQ: skillsModel.currentQuestion)
                            Answers(skillsModel: $skillsModel).disabled(disableAnswers)
                        }.padding(10)
                            .background(ViewConstants.secondaryBackground)
                        
                        ButtonTemplate(skillsModel: $skillsModel).opacity(showNextButton)
                        
                        PreferenceButton(skillsModel: $skillsModel)
                            .alignmentGuide(HorizontalAlignment.center, computeValue: {d in
                                d[HorizontalAlignment.center] - 150 })
                            .offset(y: -20)
                    }.navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
        }
    }
    
    var showNextButton: Double {
        skillsModel.gameState == .multiply ? 0.0 : 1.0
    }
    
    var disableAnswers: Bool {
        return skillsModel.gameState == .next || skillsModel.gameState == .restart
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

