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
            Color(red: 0.75, green: 1, blue: 1)
            
            VStack(spacing: 30) {
                Text("Multiplication Skills")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                VStack(spacing: 40) {
                    UserProgress()
                    Multiplication(numberOne: 17, numberTwo: 8)
                    Answers([175, 178,172,170])
                }.padding(10).background(Color.white)
                
                NextButton().hidden()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

