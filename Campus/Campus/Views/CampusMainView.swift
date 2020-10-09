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
    var showMapOptions : Bool {
        selectedTab == 0 ? true : false
    }
    
    var navBarTitle : String {
        selectedTab == 0 ? "Campus Map" : "All Buildings"
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
                        Image(systemName: "list.dash")
                        Text("All Buildings")
                    }
                    .tag(1)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Menu{
                                        Toggle(isOn: $showFavorites){
                                            Label("Favorites", systemImage: "star")
                                        }
                                        
                                        Button(action: {locationsManager.plottedBuildings.removeAll()}){
                                            Label("Clear Plotted Building", systemImage: "clear")
                                        }
                                    } label: {
                                        Image(systemName: "ellipsis.circle")
                                    }.opacity(showMapOptions ? 1 : 0),
                                trailing:
                                    Button("Center Map"){
                                        locationsManager.resetMap()
                                    }.opacity(showMapOptions ? 1 : 0)
            )
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMainView()
    }
}
