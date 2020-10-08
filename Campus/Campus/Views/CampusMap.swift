//
//  CampusMap.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/7/20.
//

import SwiftUI
import MapKit

struct CampusMap: View {
    @EnvironmentObject var locationsManager: LocationsManager
    @Binding var showFavorites: Bool
    var shownBuildings: [Building] {
        if (showFavorites) {
            let favoritedBuilding = locationsManager.allBuildings.filter({ building in
                building.favorited
            })
            let buildingSet = Set(favoritedBuilding).union(Set(locationsManager.plottedBuildings))
            return Array(buildingSet)
        } else {
            return locationsManager.plottedBuildings
        }
    }
    
    var body: some View {
        Map(coordinateRegion: $locationsManager.region, annotationItems: shownBuildings) { building in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)){
                Circle().stroke(Color.blue)
                    .frame(width: 15, height: 15)
            }
        }
    }
}

//struct CampusMap_Previews: PreviewProvider {
//    @State var showFavorites: Bool = true
//    static var previews: some View {
//        CampusMap(showFavorites: $showFavorites)
//    }
//}
