//
//  AddMoodEntry.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/1/20.
//

import SwiftUI

struct AddMoodEntry: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var journal: Journal
    
    @State var mood: Mood = .meh
    @State var text: String = "add text"
    var date: Date = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Select Mood")){
                Text("Date: \(date.formattedDate)")
                Picker("Mood: \(getEmoji(mood))", selection: $mood) {
                    ForEach(Mood.allCases, id: \.self) { mood in
                        Text("\(mood.rawValue) \(getEmoji(mood))")
                            .tag(mood)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            
            Section(header: Text("Add details")) {
                TextEditor(text: $text)
                    .frame(height: 200)
                    .onTapGesture {
                        text = ""
                    }
            }
            
            Section(){
                HStack(spacing: 16) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}){
                        Text("Cancel")
                            .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                    
                    
                    Button(action: {addMoodEntry()}){
                        Text("Add Entry")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .navigationBarTitle("Add Mood Entry")
        .navigationBarBackButtonHidden(true)
    }
    
    func getEmoji(_ mood: Mood) -> String {
        switch mood {
        case Mood.happy:
            return "😄"
        case .semiHappy:
            return "🙂"
        case .sad:
            return "🙁"
        case .terrible:
            return "😣"
        default: // .meh
            return "😐"
        }
    }
    
    func addMoodEntry() {
        let newEntry = MoodEntry(context: viewContext)
        newEntry.mood = mood.rawValue
        if text != "" && text != "add text" {
            newEntry.details = text
        }
        newEntry.date = date
        
        journal.addToMoodEntries(newEntry)

        do {
            try viewContext.save()
        } catch {
            print("Mood Entry could not be created")
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct AddMoodEntry_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMoodEntry()
//    }
//}
