//
//  GoalView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/22/20.
//

import SwiftUI

struct GoalView: View {
    var goal: Goal
    
    var body: some View {
        VStack {
            
        }.navigationBarTitle(goal.title, displayMode: .large)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
