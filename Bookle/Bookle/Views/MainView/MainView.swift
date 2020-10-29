//
//  ContentView.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import SwiftUI

enum ViewMode: CaseIterable {
    case grid
    case list
}

enum BookListMode: CaseIterable {
    case all
    case isReading
    case completed
}

struct MainView: View {
    @EnvironmentObject var shelfModel: ShelfModel
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BookMO.title, ascending: true)], animation: .default)
        private var books: FetchedResults<BookMO>
    
    @State var viewMode: ViewMode = .grid
    @State var bookListMode: BookListMode = .all
    
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewMode {
                case .grid:
                    GridView(books: books, bookListMode: $bookListMode)
                default:
                    ListRowView(books: books, bookListMode: $bookListMode)
                }
            }.navigationBarTitle("Bookle", displayMode: .inline)
            .toolbar(){
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Picker("View Mode", selection: $viewMode){
                        Label("", systemImage: "square.grid.2x2.fill").tag(ViewMode.grid)
                        Label("", systemImage: "list.dash").tag(ViewMode.list)
                    }
                    Menu {
                        Picker("Filter List", selection: $bookListMode) {
                            Text("All Books").tag(BookListMode.all)
                            Text("Reading").tag(BookListMode.isReading)
                            Text("Completed").tag(BookListMode.completed)
                        }
                    } label: {
                        Label("menu", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
        }.onAppear{
            loadBooks()
        }
    }
    
    //MARK: Core Data
    let alreadyLoadedKey = "AlreadyLoaded"
    func loadBooks() {
        let userDefaults = UserDefaults.standard
        let alreadyLoaded = userDefaults.bool(forKey: alreadyLoadedKey)
        if !alreadyLoaded {
            shelfModel.books.forEach {book in
                addBook(book: book)
                save()  // need this here so fetch results get updated!
            }
            
            userDefaults.set(true, forKey: alreadyLoadedKey)
            userDefaults.synchronize()
        }
    }
    
    func addBook(book: Book) {
        let newBook = BookMO(context: viewContext)
        newBook.author = book.author
        newBook.country = book.country
        newBook.image = book.image
        newBook.isCompleted = book.isCompleted
        newBook.isReading = book.isReading
        newBook.language = book.language
        newBook.link = book.link
        newBook.pages = book.pages
        newBook.pagesRead = book.pagesRead
        newBook.title = book.title
        newBook.year = book.year
        
        book.notes.forEach { note in
            let newNote = NoteMO(context: viewContext)
            newNote.book = newBook
            newNote.noteText = note.noteText
            newNote.pageProgress = note.pageProgress
            newNote.timeOfCreation = note.timeOfCreation
            
            newBook.addToNotes(newNote)
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
