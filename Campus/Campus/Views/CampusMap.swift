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
    var shownBuildings: [Building] {
        locationsManager.allBuildings.filter({ building in
            building.favorited
        })
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

struct CampusMap_Previews: PreviewProvider {
    static var previews: some View {
        CampusMap()
    }
}
