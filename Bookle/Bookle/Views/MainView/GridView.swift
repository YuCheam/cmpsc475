//
//  GridView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/22/20.
//

import SwiftUI

struct GridView: View {
    var books: FetchedResults<BookMO>
    @EnvironmentObject var shelfModel: ShelfModel
    @Binding var bookListMode: BookListMode
    var bookIndices: [Int] {
        switch bookListMode {
        case .all:
            return filteredBooksIndex(filterOn: {$0 == $0})
        case .isReading:
            return filteredBooksIndex(filterOn: {$0.isReading})
        default:
            return filteredBooksIndex(filterOn: {$0.isCompleted})
        }
    }
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(bookIndices, id:\.self) { index in
                    NavigationLink(destination: BookView(book: books[index])){
                        Image(books[index].image).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 180)
                    }
                }
            }
        }
    }
    
    func filteredBooksIndex(filterOn property: (BookMO) -> Bool ) -> [Int] {
        return books.enumerated().filter({property($0.element)}).map({$0.offset})
    }
}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
