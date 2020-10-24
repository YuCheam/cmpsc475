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
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
