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
                    .navigationBarTitleDisplayMode(.inline)
                    .tag(0)
                
                BuildingListView(tab: $selectedTab)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("All Buildings")
                    }.tag(1)
                
                DirectionTabView(tab: $selectedTab)
                    .tabItem {
                        Image(systemName: "arrow.right")
                        Text("Directions")
                    }.tag(2)
            }.toolbar(){
                ToolbarItem(placement: .navigationBarLeading){ toolbarLeadingContent }
                ToolbarItem(placement: .navigationBarTrailing, content: { toolbarTrailingContent })
            }
            .navigationBarTitle(toolbarTitle, displayMode: .inline)
        }
        
    }
    
    var toolbarTitle: Text {
        var title = ""
        
        switch selectedTab {
        case 1:
            title = "All Buildings"
        case 2:
            title = "Directions"
        default:
            title = "Campus Map"
        }
        
        return Text(title)
    }
    
    var toolbarLeadingContent: some View {
        switch selectedTab {
        case 1,2:
            return AnyView(EmptyView())
        default:
            return AnyView(
                Menu{
                    Toggle(isOn: $showFavorites){
                        Label("Favorites", systemImage: "star")
                    }
                    
                    Button(action: {locationsManager.plottedBuildings.removeAll()}){
                        Label("Clear Plotted Building", systemImage: "clear")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            )
        }
    }
    
    var toolbarTrailingContent: some View {
        switch selectedTab {
        case 1,2:
            return AnyView(EmptyView())
        default:
            return AnyView(
                Button("Center Map"){
                locationsManager.resetMap()
            }
)        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMainView()
    }
}
