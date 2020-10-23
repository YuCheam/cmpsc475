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
            DisclosureGroup {
                Text("Text Content")
            } label: {
                HStack{
                    Text("\(note.formattedDate)")
                    Spacer()
                    Text("\(note.pageProgress, specifier: "%.0f")/\(book.pages, specifier: "%.0f")")
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
