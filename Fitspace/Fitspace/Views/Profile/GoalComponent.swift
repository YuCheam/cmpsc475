//
//  GoalComponent.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/15/20.
//

import SwiftUI

struct GoalComponent: View {
    @Binding var title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.largeTitle)
                Text(text).font(.body)
            }
            .padding(10)
            .overlay(
              RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 2)
            )
            
            Spacer()
        }
    }
}

//struct GoalComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalComponent()
//    }
//}
