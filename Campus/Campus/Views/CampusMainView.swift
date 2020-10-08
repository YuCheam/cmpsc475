//
//  ContentView.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/6/20.
//

import SwiftUI
import MapKit

struct CampusMainView: View {
    @EnvironmentObject var locationsManager : LocationsManager
    @State var selectedTab : Int = 0
    @State var showFavorites : Bool = true
    var showMenu : Bool {
        selectedTab == 0 ? true : false
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                CampusMap(showFavorites: $showFavorites)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Campus Map")
                    }
                    .tag(0)
                BuildingListView(tab: $selectedTab)
                    .tabItem {
                        Image(systemName: "line.horizontal.3")
                        Text("All Buildings")
                    }
                    .tag(1)
            }.navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Menu("Filter"){ 
                                        Toggle("Favorites", isOn: $showFavorites)
                                        Button("Clear Plotted Buildings"){
                                            locationsManager.plottedBuildings.removeAll()
                                        }
                                    }.opacity(showMenu ? 1 : 0)
            )
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMainView()
    }
}
