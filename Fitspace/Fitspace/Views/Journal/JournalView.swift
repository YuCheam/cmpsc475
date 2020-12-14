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
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Mood Graph")
                            .font(.system(size: ViewConstants.headingSize, weight: .semibold, design: .default))
                        
                        MoodGraph(journal: journal, currentMoodEntry: $currentMoodEntry, text: $text)
                        
                        MoodDetail(currentMoodEntry: $currentMoodEntry, text: $text)
                        
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
}

struct MoodGraph: View {
    @ObservedObject var journal : Journal
    @Binding var currentMoodEntry: MoodEntry?
    @Binding var text: String
    
    var body: some View {
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
    }
}

struct MoodDetail: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var currentMoodEntry: MoodEntry?
    @Binding var text: String
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
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
