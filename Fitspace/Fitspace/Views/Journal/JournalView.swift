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
                    HStack(spacing: 16) {
                        BarView(value: 10)
                        BarView(value: 20)
                    }
                    
                    ForEach(Array(journal.journalEntries ?? []), id:\.self) { entry in
                        NavigationLink(destination: JournalEntryView(journalEntry: entry)){
                            JournalEntryComponent(journalEntry: entry)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        NavigationLink(destination: AddMoodEntry(journal: user.journal)){
                            Text("Add Mood Entry")
                        }
                        
                        NavigationLink(destination: AddJournalEntry(user: user)) {
                            Text("Add Journal Entry")
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
