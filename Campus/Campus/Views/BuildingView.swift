//
//  BuildingView.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/7/20.
//

import SwiftUI

struct BuildingView: View {
    @EnvironmentObject var locationsManager : LocationsManager
    @Environment(\.presentationMode) var presentation
    @Binding var building : Building
    @Binding var tab: Int
    
    var body: some View {
        Form {
            Section {
                Text(building.name)
            }

            Toggle(isOn: $building.favorited) {
                Text("Favorite "+isFavorited(for: building.favorited))
            }
            
            Button("Plot"){
                locationsManager.plottedBuildings.append(building)
                
                // Change to Map View
                tab = 0
                self.presentation.wrappedValue.dismiss()
                
                // Center View
                locationsManager.centerToPlot(for: building)
            }
            .frame(width: 36, height: 12)
            .foregroundColor(.blue)
            
        }.navigationBarTitle(building.name)
    }
    
    func isFavorited(for favorited: Bool) -> String {
        return favorited ? "★" : "☆"
    }
}

//struct BuildingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingView()
//    }
//}
