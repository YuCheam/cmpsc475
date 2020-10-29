//
//  BookNotesView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import SwiftUI

struct BookNotesView: View {
    @ObservedObject var book: BookMO
    var notes: [NoteMO] {
        Array(book.notes).sorted(by: { (note1: NoteMO, note2: NoteMO) in
            note1.timeOfCreation < note2.timeOfCreation
        })
    }
//    @Binding var book: Book
    @State var isEditing: Bool = false
    @State var editingText: String = ""
    
    var body: some View {
        List {
            ForEach(notes.indices, id: \.self) { index in
                DisclosureGroup {
                    NoteView(index: index, book: book, note: notes[index])
                } label: {
                    HStack{
                        Text("\(notes[index].formattedDate)")
                        Spacer()
                        Text("\(notes[index].pageProgress, specifier: "%.0f")/\(book.pages, specifier: "%.0f")")
                        Button(action: {
                            book.deleteFromNotes(notes[index])
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
