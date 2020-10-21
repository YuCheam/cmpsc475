//
//  ShelfManager.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import Foundation

class ShelfModel: ObservableObject {
    let booksManager: BooksManager
    @Published var books: [Book]
    
    init() {
        let _booksManager = BooksManager()
        books = _booksManager.books
        booksManager = _booksManager
    }
    
    func filteredBooksIndex(filterOn property: (Book) -> Bool ) -> [Int] {
        return books.enumerated().filter({property($0.element)}).map({$0.offset})
    }
    
    func saveData() {
        booksManager.saveData()
    }
}
