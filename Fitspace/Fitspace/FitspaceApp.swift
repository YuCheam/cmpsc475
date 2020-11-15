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
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceController.container.viewContext)
        }.onChange(of: scenePhase){ phase in
            switch phase {
            case .inactive:
                try? persistanceController.container.viewContext.save()
            default:
                break
            }
        }
    }
}
