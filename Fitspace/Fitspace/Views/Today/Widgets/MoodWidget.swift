//
//  MoodWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct MoodWidget: View {
    @ObservedObject var journal: Journal
    
    var mood: MoodEntry? {
        let array = Array(journal.moodEntries ?? [])
        if array.count != 0 {
            return array.sorted(by: {$0.date > $1.date})[0]
        } else {
            return nil
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Mood")
                .font(.system(size: ViewConstants.headingSize, weight: .semibold, design: .default))
            
            HStack(alignment: .center) {
                if mood != nil {
                    Text("\(mood!.moodEmoji)")
                        .font(.system(size: 64))
                    VStack(alignment: .leading) {
                        Text("Date: \(mood!.stringDate)")
                        Text("Details: \(mood!.details ?? "")")
                    }
                } else {
                    Text("No Mood Entries")
                }
            }
        }.modifier(CardModifier())
    }
}

//struct MoodWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        MoodWidget()
//    }
//}
