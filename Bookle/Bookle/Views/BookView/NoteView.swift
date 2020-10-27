//
//  NoteView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/24/20.
//

import SwiftUI

struct NoteView: View {
    var index: Int
    @Binding var book: Book
    @State var isEditing: Bool = false
    @State var editingText: String = ""
    
    
    var body: some View {
        HStack{
            if book.notes.indices.contains(index) {
                if isEditing {
                    TextField("", text: $editingText, onEditingChanged: {_ in}){
                        book.notes[index].noteText = editingText
                        isEditing = false
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    Text("\(book.notes[index].noteText)")
                }
            }
            
            Spacer()
            
            Button(isEditing ? "done" : "edit", action: {
                book.notes[index].noteText = editingText
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
