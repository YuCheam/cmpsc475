//
//  NoteView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/24/20.
//

import SwiftUI

struct NoteView: View {
    var index: Int
    @ObservedObject var book: BookMO
    @ObservedObject var note: NoteMO
    //@Binding var book: Book
    @State var isEditing: Bool = false
    @State var editingText: String = ""
    
    
    var body: some View {
        HStack{
            if isEditing {
                TextField("", text: $editingText, onEditingChanged: {_ in}){
                    note.noteText = editingText
                    isEditing = false
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text("\(note.noteText)")
            }
            
            Spacer()
            
            Button(isEditing ? "done" : "edit", action: {
//                book.notes[index].noteText = editingText
                isEditing.toggle()
            }).padding(5)
            .background(Color.blue)
            .cornerRadius(8)
            .foregroundColor(Color.white)
        }
    }
}

//struct NoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteView()
//    }
//}
