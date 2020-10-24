//
//  BookNotesView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import SwiftUI

struct BookNotesView: View {
    @Binding var book: Book
    let note: Note = Note(page: 10, text: "I'm a Note")
    
    var body: some View {
        VStack {
            ForEach(book.notes.indices, id: \.self) { index in
                DisclosureGroup {
                    Text("\(book.notes[index].noteText)")
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
