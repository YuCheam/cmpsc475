//
//  BookleApp.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import SwiftUI

@main
struct BookleApp: App {
    let persistanceController = PersistenceController.shared
    let shelfModel = ShelfModel()
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(shelfModel)
                .environment(\.managedObjectContext, persistanceController.container.viewContext)
        }.onChange(of: scenePhase){ phase in
            switch phase {
            case .inactive:
                shelfModel.saveData()
                try? persistanceController.container.viewContext.save()
            default:
                break
            }
        }
    }
}
