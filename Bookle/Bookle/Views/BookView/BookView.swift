//
//  BookView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/22/20.
//

import SwiftUI

struct BookView: View {
    @Binding var book: Book
    
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
                
        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView()
//    }
//}
