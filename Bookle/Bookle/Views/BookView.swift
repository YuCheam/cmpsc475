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
        VStack() {
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
        }
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView()
//    }
//}
