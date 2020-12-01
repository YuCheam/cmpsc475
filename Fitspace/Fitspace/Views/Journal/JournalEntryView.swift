//
//  JournalEntryView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/1/20.
//

import SwiftUI

struct JournalEntryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var journalEntry: JournalEntry
    
    @State var isChangingTitle: Bool = false
    @State var title = ""
    @State var text = ""
    
    var date: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(date)
            TextEditor(text: $text)
                .border(Color.black, width: 1)
                .disableAutocorrection(true)
                .onDisappear(){
                    journalEntry.setValue(text, forKey: "text")
                    
                    do {
                        try viewContext.save()
                    } catch {
                        print("Title could not be changed")
                    }
                }
                
        }.padding(10)
        .onAppear(){
            title = journalEntry.title
            text = journalEntry.text
        }
        .navigationBarTitle(journalEntry.title)
        .toolbar(){
            ToolbarItem(placement: .navigationBarTrailing){
                Menu {
                    Button("Change Journal Entry Title", action: {isChangingTitle.toggle()})
                }
                label: {
                    Label("settings", systemImage: "gear")
                }
                
            }
        }
        .sheet(isPresented: $isChangingTitle){
            Form {
                Section(header: Text("Change journal entry title")) {
                    TextField("Change title", text: $title)
                }
                
                Section {
                    HStack {
                        Button(action: {isChangingTitle.toggle()}){
                            Text("Cancel")
                                .modifier(ButtonStyle(ViewConstants.errorButtonColor))
                        }.buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        
                        Button(action: {changeTitle()}){
                            Text("Save")
                                .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
    
    func changeTitle() {
        journalEntry.setValue(title, forKey: "title")
        
        do {
            try viewContext.save()
        } catch {
            print("Title could not be changed")
        }
    }
    
    init(journalEntry: JournalEntry){
        self.journalEntry = journalEntry
        self.date = journalEntry.date.formattedDate
    }
}

//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView()
//    }
//}
