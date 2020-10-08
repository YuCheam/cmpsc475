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
    
    var body: some View {
        NavigationView {
            VStack{
                
                CampusMap()
                
                
            }.navigationBarItems(trailing: NavigationLink(destination: BuildingListView()){
                Text("All Buildings").bold()
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .principal){
                    Text("Campus")
                }
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMainView()
    }
}
