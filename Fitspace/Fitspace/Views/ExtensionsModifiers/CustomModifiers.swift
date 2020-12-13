//
//  CustomModifiers.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/28/20.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 150, height: 50)
            .background(color)
            .cornerRadius(15.0)
        
    }
    
    init(_ color: Color) {
        self.color = color
    }
}

struct OnboardingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
    }
}

struct FieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .disableAutocorrection(true)
            .padding()
            .background(Color.white)
            .cornerRadius(16)
    }
}
