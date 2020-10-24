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
        List {
            ForEach(book.notes.indices, id: \.self) { index in
                DisclosureGroup {
                    NoteView(index: index, book: $book)
                } label: {
                    HStack{
                        Text("\(book.notes[index].formattedDate)")
                        Spacer()
                        Text("\(book.notes[index].pageProgress, specifier: "%.0f")/\(book.pages, specifier: "%.0f")")
                        Button(action: {
                            book.deleteNote(index: index)
                        }, label: {Label("", systemImage: "trash")})
                    }
                }
            }

        }.padding()
    }
}

//struct BookNotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookNotesView()
//    }
//}
