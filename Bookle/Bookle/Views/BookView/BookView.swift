//
//  BookView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/22/20.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var book: BookMO
    
    //@Binding var book: Book
    @State var isAdding: Bool = false
    @State var addingText: String = ""
    @State var currentTab: Int = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            BookDetailView(book: _book).tabItem {
                Image(systemName: "book")
                Text("Book")
            }.tag(0)
            
            BookNotesView(book: book).tabItem {
                Image(systemName: "square.and.pencil")
                Text("Notes")
            }.tag(1)
        }.toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                if currentTab == 1 {
                    Button("+") {isAdding.toggle()}
                }
            }
        }
//        .sheet(isPresented: $isAdding){
//            Form {
//                TextField("Add", text: $addingText, onEditingChanged: { _ in }) {
//                    let note = Note(page: book.pagesRead, text: addingText)
//                    book.addNote(note: note)
//                    addingText = ""
//                    isAdding = false
//                }
//                Button("Clear Note"){
//                    isAdding = false
//                    addingText = ""
//                }
//            }.navigationBarTitle("Add Note")
//        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView()
//    }
//}
