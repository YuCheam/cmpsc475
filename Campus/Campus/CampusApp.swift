//
//  CampusApp.swift
//  Campus
//
//  Created by Kha-Yu Cheam on 10/6/20.
//

import SwiftUI

@main
struct CampusApp: App {
    let campusData = CampusData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            CampusView().environmentObject(campusData)
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
