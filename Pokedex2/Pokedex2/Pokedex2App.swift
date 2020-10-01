//
//  Pokedex2App.swift
//  Pokedex2
//
//  Created by Kha-Yu Cheam on 9/29/20.
//

import SwiftUI

@main
struct Pokedex2App: App {
    @ObservedObject var pokedex = Pokedex()
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            PokedexMain().environmentObject(pokedex)
        }
        
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .inactive:
                pokedex.saveData()
            default:
                break
            }
        }
        
    }
}
