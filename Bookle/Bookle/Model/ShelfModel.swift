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
    
    func saveData() {
        booksManager.saveData()
    }
}
