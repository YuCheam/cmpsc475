//
//  AddJournalEntry.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/28/20.
//

import SwiftUI

struct AddJournalEntry: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var entryTitle: String = ""
    @State var entryText: String = "add text"
    var date = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Title")){
                TextField("Journal Entry Title", text: $entryTitle)
            }
            
            Section(header: Text("Text")) {
                Text("Date of entry: \(date.formattedDate)")
                
                TextEditor(text: $entryText)
                    .foregroundColor(Color.gray)
                    .frame(height: 100)
            }
            
            Section(){
                HStack {
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("Cancel")
                            .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                    }
                    
                    Button(action: {}){
                        Text("Add Entry")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }
                }
            }
            
        }.navigationBarTitle("Add Journal Entry", displayMode: .large)
    }
}

struct AddJournalEntry_Previews: PreviewProvider {
    static var previews: some View {
        AddJournalEntry()
    }
}
