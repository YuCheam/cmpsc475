//
//  WelcomeView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/13/20.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var pushUserInfo: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Text("Fitspace")
                    .foregroundColor(Color.white)
                    .font(.system(size: 48, weight: .bold, design: .default))
                
                Text("Create an account")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                
            }
            
            Button(action: {
                pushUserInfo = true
            }, label: {
                Text("Next →")
                    .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .offset(y: -36)
        }.modifier(OnboardingModifier())
    }
}

//struct WelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView()
//    }
//}
