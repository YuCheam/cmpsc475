//
//  JournalView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI
import CoreData

struct JournalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: User
    @ObservedObject var journal: Journal
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    NavigationLink(destination: AddJournalEntry(user: user)) {
                        Text("Add Entry")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }
                    
                    ForEach(Array(journal.journalEntries ?? []), id:\.self) { entry in
                        NavigationLink(destination: JournalEntryView(journalEntry: entry)){
                            JournalEntryComponent(journalEntry: entry)
                        }
                    }
                }
            }.navigationBarTitle("Journal", displayMode: .large)
        }
    }
    
}


//struct JournalView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalView()
//    }
//}
