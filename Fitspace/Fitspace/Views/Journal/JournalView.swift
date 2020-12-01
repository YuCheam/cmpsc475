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
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    @ObservedObject var journal: Journal
    
    var body: some View {
        if user.count != 0 {
            NavigationView {
                ScrollView{
                    VStack {
                        NavigationLink(destination: AddJournalEntry(user: user[0])) {
                            Text("Add Entry")
                                .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                        }
                        
                        ForEach(Array(journal.journalEntries ?? []), id:\.self) { entry in
                            HStack {
                                Text(entry.title)
                                Spacer()
                                Button(action: {deleteEntry(for: entry)}) {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }.navigationBarTitle("Journal", displayMode: .large)
            }
        }
    }
    
    func deleteEntry(for entry: JournalEntry) {
        user[0].journal.removeFromJournalEntries(entry)
        do {
            try viewContext.save()
        } catch {
            print("Could not save view context")
        }
    }
    
}


//struct JournalView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalView()
//    }
//}
