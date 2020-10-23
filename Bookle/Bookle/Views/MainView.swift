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
    @State var viewMode: ViewMode = .grid
    @State var bookListMode: BookListMode = .all
    
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewMode {
                case .grid:
                    GridView(bookListMode: $bookListMode)
                default:
                    ListRowView(bookListMode: $bookListMode)
                }
            }.navigationBarTitleDisplayMode(.inline)
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu {
                        Picker("View Mode", selection: $viewMode){
                            Text("Grid").tag(ViewMode.grid)
                            Text("List").tag(ViewMode.list)
                        }
                        
                        Picker("Filter List", selection: $bookListMode) {
                            Text("All Books").tag(BookListMode.all)
                            Text("Is Completed").tag(BookListMode.completed)
                            Text("Is Reading").tag(BookListMode.isReading)
                        }
                    } label: {
                        Label("menu", systemImage: "gear")
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
