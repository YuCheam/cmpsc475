//
//  GoalComponent.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/15/20.
//

import SwiftUI

struct GoalComponent: View {
//    @Binding var title: String
//    @Binding var text: String
    
    var title: String = "Goal Title"
    var text: String = "Text text text text text text text"
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.largeTitle)
                Text(text).font(.body)
            }
            
            Spacer()
        }
        .padding(10)
        .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(12)
        .lineLimit(6)
        .font(.footnote)
        .foregroundColor(Color.white)
    }
}

struct GoalComponent_Previews: PreviewProvider {
    static var previews: some View {
        GoalComponent()
    }
}
