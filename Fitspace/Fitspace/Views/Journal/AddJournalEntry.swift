//
//  AddJournalEntry.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/28/20.
//

import SwiftUI

struct AddJournalEntry: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var user: User
    
    @State var entryTitle: String = ""
    @State var entryText: String = "add text"
    @State var showAlert: Bool = false
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
                    .animation(.default)
                    .onTapGesture(){
                        entryText = ""
                    }
            }
            
            Section(){
                HStack {
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("Cancel")
                            .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {addJournalEntry()}){
                        Text("Add Entry")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            
        }.navigationBarTitle("Add Journal Entry", displayMode: .large)
        .alert(isPresented: $showAlert){
            Alert(title: Text("Cannot Add"), message: Text("Title and text fields must have value"), dismissButton: .default(Text("dismiss")))
        }
    }
    
    func addJournalEntry() {
        if entryTitle == "" || entryText == "add text"  || entryText == ""{
            showAlert.toggle()
        } else {
            let newEntry = JournalEntry(context: viewContext)
            newEntry.title = entryTitle
            newEntry.text = entryText
            newEntry.date = date
            
            user.journal.addToJournalEntries(newEntry)

            do {
                try viewContext.save()
            } catch {
                print("Journal Entry could not be created")
            }
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct AddJournalEntry_Previews: PreviewProvider {
//    static var previews: some View {
//        AddJournalEntry()
//    }
//}
