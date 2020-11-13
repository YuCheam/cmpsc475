//
//  FitspaceApp.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

@main
struct FitspaceApp: App {
    let persistanceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistanceController.container.viewContext)
        }
    }
}
