//
//  BookleApp.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/19/20.
//

import SwiftUI

@main
struct BookleApp: App {
    let shelfModel = ShelfModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(shelfModel)
        }
    }
}
