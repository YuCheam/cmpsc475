//
//  JournalView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct JournalView: View {
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    
    var body: some View {
        if user.count != 0 {
            NavigationView {
                ScrollView{
                    VStack {
                        NavigationLink(destination: AddJournalEntry(user: user[0])) {
                            Text("Add Entry")
                                .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                        }
                        
                        ForEach(Array(user[0].journal.journalEntries ?? [])) { entry in
                            Text(entry.title)
                        }
                    }
                }.navigationBarTitle("Journal", displayMode: .large)
            }
        }
    }
}


struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
