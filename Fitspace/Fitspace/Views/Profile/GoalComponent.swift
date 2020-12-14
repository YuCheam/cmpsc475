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
    @ObservedObject var goal: Goal
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.seal")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color.accent)
            
            VStack(alignment: .leading) {
                Text(goal.title)
                    .font(.system(size: ViewConstants.headingSize, weight: .semibold))
                Text(goal.details)
                Text("\(goal.timeToCompletion)")
            }.padding(.horizontal, 12)
            .foregroundColor(Color.black)
            
            Spacer()
            
            Button(action: {deleteGoal()}){
                Label("", systemImage: "trash")
            }.buttonStyle(PlainButtonStyle())
            .foregroundColor(Color.accent)
    
        }.padding(.horizontal, 12)
        .padding(.vertical, 24)
        .background(Color.white)
        .cornerRadius(6)
        .lineLimit(6)
        .shadow(radius: 12)
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
