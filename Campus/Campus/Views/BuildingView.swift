//
//  BuildingView.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/7/20.
//

import SwiftUI

struct BuildingView: View {
    @Binding var building : Building
    
    var body: some View {
        Form {
            Section {
                Text(building.name)
            }

            Toggle(isOn: $building.favorited) {
                Text("Favorite "+isFavorited(for: building.favorited))
            }
            
            Button(action: {plotBuilding()}){
                Text("Plot")
            }.frame(width: 36, height: 12)
            .foregroundColor(.blue)
        }.navigationBarTitle(building.name)
    }
    
    func isFavorited(for favorited: Bool) -> String {
        return favorited ? "★" : "☆"
    }
    
    func plotBuilding() {
        
    }
}

//struct BuildingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildingView()
//    }
//}
