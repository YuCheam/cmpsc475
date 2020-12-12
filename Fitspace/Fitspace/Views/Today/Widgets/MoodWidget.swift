//
//  MoodWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct MoodWidget: View {
    var body: some View {
        HStack {
            Text("Mood Widget")
        }.modifier(CardModifier())
    }
}

struct MoodWidget_Previews: PreviewProvider {
    static var previews: some View {
        MoodWidget()
    }
}
