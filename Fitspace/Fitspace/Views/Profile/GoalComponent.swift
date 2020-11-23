//
//  GoalComponent.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/15/20.
//

import SwiftUI

struct GoalComponent: View {
    @Environment(\.managedObjectContext) private var viewContext
    var user: User
    var goal: Goal
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(goal.title).font(.largeTitle)
                Text(goal.details).font(.body)
            }
            
            Spacer()
            
            Button(action: {deleteGoal()}){
                Label("", systemImage: "trash")
            }
        }
        .padding(8)
        .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.primaryLight]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(12)
        .lineLimit(6)
        .font(.footnote)
        .foregroundColor(Color.white)
    }
    
    func deleteGoal() {
        user.removeFromGoals(goal)
        
        do {
            try viewContext.save()
        } catch {
            print("Goal could not be removed")
        }
    }
}

//struct GoalComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalComponent()
//    }
//}
