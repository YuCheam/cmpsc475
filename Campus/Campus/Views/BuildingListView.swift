//
//  BuildingListView.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/7/20.
//

import SwiftUI

struct BuildingListView: View {
    @EnvironmentObject var locationsManager : LocationsManager
    
    var body: some View {
        List{
            ForEach(locationsManager.allBuildings.indices){ index in
                NavigationLink(destination: BuildingView(building: $locationsManager.allBuildings[index])){
                    HStack{
                        Text(locationsManager.allBuildings[index].name)
                        Spacer()
                        Text(isFavorited(for: locationsManager.allBuildings[index].favorited))
                    }
                }
            }
        }
    }
    
    func isFavorited(for favorited: Bool) -> String {
        return favorited ? "★" : "☆"
    }
}

struct BuildingListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingListView()
    }
}
