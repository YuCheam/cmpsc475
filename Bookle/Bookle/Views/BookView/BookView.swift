//
//  BookView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/22/20.
//

import SwiftUI

struct BookView: View {
    @Binding var book: Book
    @State var isAdding: Bool = false
    @State var addingText: String = ""
    
    var body: some View {
        TabView {
            BookDetailView(book: $book).tabItem {
                Image(systemName: "book")
                Text("Book")
            }
            
            BookNotesView(book: $book).tabItem {
                Image(systemName: "square.and.pencil")
                Text("Notes")
            }
        }.toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("+") {isAdding.toggle()}
            }
        }.sheet(isPresented: $isAdding){
            TextField("Add", text: $addingText, onEditingChanged: { _ in })
            {
                let note = Note(page: book.pagesRead, text: addingText)
                book.addNote(note: note)
                addingText = ""
                isAdding = false
            }
            Button("Dismiss"){
                isAdding = false
                addingText = ""
            }
            .textFieldStyle(RoundedBorderTextFieldStyle() )
        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView()
//    }
//}
