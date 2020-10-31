//
//  BookView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/22/20.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var book: BookMO
    @Environment(\.managedObjectContext) private var viewContext
    @State var isAdding: Bool = false
    //@Binding var book: Book
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
        }.navigationBarTitle(book.title)
        .toolbar() {
            ToolbarItem(placement: .navigationBarTrailing) {
                if currentTab == 1 {
                    Button("+") {isAdding.toggle()}
                }
            }
        }
        .sheet(isPresented: $isAdding){
            AddNoteView(book: book, isAdding: $isAdding)
        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView()
//    }
//}
