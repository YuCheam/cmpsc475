//
//  BookDetailView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    let formatter: NumberFormatter
    
    var body: some View {
        VStack {
            Toggle("Currently Reading", isOn: $book.isReading)
            Toggle("Finished Reading", isOn: $book.isCompleted)
            Image(book.image).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 232)
            Text(book.title)
            Text("Author: \(book.author ?? " ")")
            Text("Year: \(book.year)")
            Text("Country: \(book.country)")
            Text("Language: \(book.language)")
            ProgressView(value: book.pagesRead, total: book.pages)
            HStack {
                Text("Current Page:")
                TextField("Current Page Number...", value: $book.pagesRead, formatter: formatter)
                    .frame(width: 72)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("of \(book.pages, specifier: "%.0f")")
            }
        }
    }
    
    init(book: Binding<Book>) {
        self._book = book
        formatter = NumberFormatter()
        formatter.minimum = 0
        formatter.maximum = NSNumber(value: book.pages.wrappedValue)
        formatter.allowsFloats = false
    }
}


//struct BookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetailView()
//    }
//}
