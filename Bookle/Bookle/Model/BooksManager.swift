//
//  BookManager.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import Foundation

struct Book : Identifiable, Hashable {
    let author: String?
    let country: String
    let image: String
    let language: String
    let link: String
    var pages: Float
    let title: String
    let year: Int
    
    var id: String {title}
    
    var isReading: Bool
    var isCompleted: Bool
    var pagesRead: Float
    
    enum CodingKeys: String, CodingKey {
        case author
        case country
        case image
        case language
        case link
        case pages
        case title
        case year
        case isReading
        case isCompleted
        case pagesRead
    }
}

extension Book: Codable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        country = try values.decode(String.self, forKey: .country)
        image = try values.decode(String.self, forKey: .image)
        language = try values.decode(String.self, forKey: .language)
        link = try values.decode(String.self, forKey: .link)
        pages = try values.decode(Float.self, forKey: .pages)
        title = try values.decode(String.self, forKey: .title)
        year = try values.decode(Int.self, forKey: .year)
        isReading = try values.decodeIfPresent(Bool.self, forKey: .isReading) ?? false
        isCompleted = try values.decodeIfPresent(Bool.self, forKey: .isCompleted) ?? false
        pagesRead = try values.decodeIfPresent(Float.self, forKey: .pagesRead) ?? 0
    }
}

class BooksManager {
    private let destinationURL: URL
    var books : [Book]
    
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
