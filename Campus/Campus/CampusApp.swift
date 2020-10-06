//
//  CampusApp.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/6/20.
//

import SwiftUI

@main
struct CampusApp: App {
    let campusData = LocationsManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            CampusMainView().environmentObject(campusData)
        }.onChange(of: scenePhase){ phase in
            switch phase {
            case .inactive:
                campusData.saveData()
            default:
                break
            }
        }
    }
}
