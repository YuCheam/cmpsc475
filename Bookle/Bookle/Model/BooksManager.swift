//
//  BookManager.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import Foundation

struct Book : Codable, Identifiable {
    let author: String?
    let country: String
    let image: String
    let language: String
    let link: String
    let pages: Int
    let title: String
    let year: Int
    
    var id: String {title}
}

class BooksManager {
    private let destinationURL: URL
    let books : [Book]
    
    init() {
        let filename = "books"
        let bookURL = Bundle.main.url(forResource: filename, withExtension: "json")!
        
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        destinationURL = documentURL.appendingPathComponent(filename+".json")
        
        let fileExists = fileManager.fileExists(atPath: destinationURL.path)
        let url = fileExists ? destinationURL : bookURL

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            books = try decoder.decode([Book].self, from: data)
        } catch   {
            print("Error decoding Books: \(error)")
            books = []
        }
    }
    
    //MARK: Save Data
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(books)
            try data.write(to: destinationURL)
        } catch {
            print("Error writing data")
        }
    }
}
