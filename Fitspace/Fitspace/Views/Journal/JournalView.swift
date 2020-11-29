//
//  JournalView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct JournalView: View {
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(destination: AddJournalEntry()) {
                        Text("Add Entry")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }
                }
            }.navigationBarTitle("Journal", displayMode: .large)
        }
    }
    
    func addJournalEntry() {
        
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
