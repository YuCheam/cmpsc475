//
//  NoteView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/24/20.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var book: BookMO
    @ObservedObject var note: NoteMO
    @State var isEditing: Bool = false
    
    
    var body: some View {
        VStack{
            TextEditor(text: $note.noteText)
                .foregroundColor(isEditing ? Color.gray : .black)
                .disabled(!isEditing)
            
            HStack {
                Spacer()
                
                Button(action: { isEditing.toggle()},
                       label: {
                        Text(isEditing ? "done" : "edit")
                       }).padding(5)
                .background(Color.blue)
                .cornerRadius(8)
                .foregroundColor(Color.white)
                .buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    book.deleteFromNotes(note)
                }, label: {Label("", systemImage: "trash")})
                .buttonStyle(BorderlessButtonStyle())
            }
                            
        }
    }
}

//struct NoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteView()
//    }
//}
