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
    
    @State var currentMoodEntry: MoodEntry? = nil
    @State var text: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Mood Graph").font(.headline)
                        ScrollView(.horizontal) {
                            HStack(alignment: .bottom, spacing: 16) {
                                ForEach(Array(journal.moodEntries ?? [])) { entry in
                                    VStack {
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .opacity(currentMoodEntry == entry ? 1.0 : 0.0)
                                
                                        BarView(moodEntry: entry)
                                            .onTapGesture {
                                                currentMoodEntry = entry
                                                text = entry.details ?? ""
                                            }
                                    }.frame(height: 300)
                                }
                                Spacer()
                            }
                        }.onTapGesture {
                            if currentMoodEntry != nil {
                                currentMoodEntry = nil
                            }
                        }
                        
                        Text("Details:")
                        HStack {
                            if isEditing {
                                TextEditor(text: $text)
                            } else {
                                Text(currentMoodEntry?.details ?? "")
                            }
                            
                            Spacer()
                            
                            VStack {
                                Button(){
                                    currentMoodEntry!.setValue(text, forKey: "details")
                                    do {
                                        try viewContext.save()
                                    } catch {
                                        print("Mood Entry details could not be changed")
                                    }
                                    
                                    isEditing.toggle()
                                }
                                label: {
                                    Label(isEditing ? "done" : "edit", systemImage: "pencil")
                                }
                                
                                Button(action: {deleteMoodEntry(currentMoodEntry!)}){
                                    Label("delete", systemImage: "trash")
                                }
                            }
                            
                            
                        }.opacity(currentMoodEntry != nil ? 1.0 : 0.0)
                    }
                    .padding()
                    .background(Color.graphColor)
                    
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
    
    func deleteMoodEntry(_ entry: MoodEntry) {
        viewContext.delete(entry)
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
