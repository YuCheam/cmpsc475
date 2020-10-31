//
//  AddNoteView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/29/20.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var book: BookMO
    @State var addingText: String = ""
    @Binding var isAdding: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Text("Date: \(Date().description)")
                Text("Page: \(book.pagesRead, specifier: "%.0f")")
                
                TextField("Add", text: $addingText, onEditingChanged: { _ in }) {
                    addNote()
                }
                HStack {
                    Button("Add Note"){
                        addNote()
                    }.padding(5)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(Color.white)
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    
                    Button("Clear Note"){
                        isAdding = false
                        addingText = ""
                    }.padding(5)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(Color.white)
                    .buttonStyle(BorderlessButtonStyle())
                }
            }.navigationBarTitle("Add Note")
        }
    }
    
    func addNote() {
        let newNote = NoteMO(context: viewContext)
        newNote.book = book
        newNote.noteText = addingText
        newNote.pageProgress = book.pagesRead
        newNote.timeOfCreation = Date()
        
        book.addToNotes(newNote)
        addingText = ""
        isAdding = false
        try? viewContext.save()
    }
}

//struct AddNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNoteView()
//    }
//}
