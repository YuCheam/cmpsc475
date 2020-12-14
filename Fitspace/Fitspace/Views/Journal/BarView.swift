//
//  BarView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/1/20.
//

import SwiftUI

struct BarView: View {
    @ObservedObject var moodEntry: MoodEntry
    var value: CGFloat {
        switch moodEntry.moodType {
        case .happy:
            return 200
        case .semiHappy:
            return 150
        case .meh:
            return 100
        case .sad:
            return 50
        default: //.terible
            return 0
        }
    }
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color.offWhite)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color.accent)
                Text("\(moodEntry.moodEmoji)")
                    .baselineOffset(value)
            }
            Text(moodEntry.stringDate).padding(.top, 8)
        }
    }
}

//struct BarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarView()
//    }
//}
