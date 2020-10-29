//
//  BookDetailView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import SwiftUI

struct BookDetailView: View {
    @ObservedObject var book: BookMO
    //@Binding var book: Book
    let formatter: NumberFormatter
    
    var body: some View {
        List {
            
            Section {
                HStack() {
                    Image(book.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 164)
                        
                    VStack(alignment: .leading) {
                        Text(book.title)
                        Text("Author: \(book.author ?? " ")")
                        Text("Year: \(book.year)")
                        Text("Country: \(book.country)")
                        Text("Language: \(book.language)")
                    }
                }
            }
            
            Section(header: Text("List")) {
                VStack{
                    Toggle("Currently Reading", isOn: $book.isReading)
                    Toggle("Finished Reading", isOn: $book.isCompleted)
                }
            }
            
            Section(header: Text("Reading Progress")) {
                ProgressView(value: book.pagesRead, total: book.pages)
                
                HStack {
                    Text("Current Page:")
                    TextField("Current Page Number...", value: $book.pagesRead, formatter: formatter)
                        .frame(width: 72)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("of \(book.pages, specifier: "%.0f")")
                }
            }
        }.listStyle(InsetGroupedListStyle())
    }
    
    init(book: ObservedObject<BookMO>) {
        self._book = book
        formatter = NumberFormatter()
        formatter.minimum = 0
        formatter.maximum = NSNumber(value: book.wrappedValue.pages)
        formatter.allowsFloats = false
    }
}


//struct BookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetailView()
//    }
//}
