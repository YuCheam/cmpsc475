//
//  BookNotesView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import SwiftUI

struct BookNotesView: View {
    @Binding var book: Book
    @State var isEditing: Bool = false
    @State var editingText: String = ""
    
    var body: some View {
        VStack {
            ForEach(book.notes.indices, id: \.self) { index in
                DisclosureGroup {
//                    VStack {
//                        TextEditor(text: $book.notes[index].noteText)
//                            .foregroundColor(isEditing ? Color.gray : Color.black)
//                            .disabled(!isEditing)
//                        Spacer()
//                        HStack{
//                            Button(isEditing ? "done" : "edit", action: {isEditing.toggle()})
//                                .cornerRadius(10)
//                                .padding()
//                                .background(Color("cyan"))
//                        }
//                    }
                    NoteView(index: index, book: $book)
                } label: {
                    HStack{
                        Text("\(book.notes[index].formattedDate)")
                        Spacer()
                        Text("\(book.notes[index].pageProgress, specifier: "%.0f")/\(book.pages, specifier: "%.0f")")
                        Button(action: {
                            delete(index: index)
//                            book.deleteNote(index: index)
                        }, label: {Label("", systemImage: "trash")})
                    }
                }
            }

        }.padding()
    }
    
    func delete (index: Int){
        book.deleteNote(index: index)
    }
}

//struct BookNotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookNotesView()
//    }
//}
