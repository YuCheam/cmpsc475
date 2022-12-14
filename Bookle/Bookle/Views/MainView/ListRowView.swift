//
//  ListRowView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/20/20.
//

import SwiftUI

struct ListRowView: View {
    var books: FetchedResults<BookMO>
    @EnvironmentObject var shelfModel: ShelfModel
    @Binding var bookListMode: BookListMode
    var bookIndices: [Int] {
        switch bookListMode {
        case .all:
            return shelfModel.filteredBooksIndex(filterOn: {$0 == $0})
        case .isReading:
            return shelfModel.filteredBooksIndex(filterOn: {$0.isReading})
        default:
            return shelfModel.filteredBooksIndex(filterOn: {$0.isCompleted})
        }
    }
    
    var body: some View {
        List {
            ForEach(bookIndices, id: \.self){ index in
                NavigationLink(destination: BookView(book: books[index])) {
                    RowItem(book: books[index])
                }
            }
        }
    }
}

//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView()
//    }
//}
