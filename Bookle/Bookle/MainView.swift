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

struct MainView: View {
    @EnvironmentObject var shelfModel: ShelfModel
    @State var viewMode: ViewMode = .grid
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch viewMode {
                case .grid:
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(shelfModel.books.indices, id:\.self) { index in
                            Image(shelfModel.books[index].image).resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 180)
                        }
                    }
                default:
                    ListRowView()
                }
            }.toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Picker("View Mode", selection: $viewMode){
                        Text("Grid").tag(ViewMode.grid)
                        Text("List").tag(ViewMode.list)
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
