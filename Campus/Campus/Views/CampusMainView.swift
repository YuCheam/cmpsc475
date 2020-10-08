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
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                CampusMap(showFavorites: $showFavorites)
                    .tabItem {
                        Text("Campus Map")
                    }
                    .tag(0)
                BuildingListView()
                    .tabItem {
                        Text("All Buildings")
                    }
                    .tag(1)
            }.navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Menu("Filter"){
                                        Toggle("Favorites", isOn: $showFavorites)
                                        Button(action: {}){
                                            Text("Clear Plotted Buildings")
                                        }
                                    }
            )
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMainView()
    }
}
