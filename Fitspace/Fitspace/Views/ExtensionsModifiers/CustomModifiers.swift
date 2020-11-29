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
