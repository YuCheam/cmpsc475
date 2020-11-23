//
//  GoalComponent.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/15/20.
//

import SwiftUI

struct GoalComponent: View {
    var title: String
    var text: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.largeTitle)
                Text(text).font(.body)
            }
            
            Spacer()
        }
        .padding(8)
        .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.primaryLight]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(12)
        .lineLimit(6)
        .font(.footnote)
        .foregroundColor(Color.white)
    }
}

//struct GoalComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalComponent()
//    }
//}
