//
//  ContentView.swift
//  Headway
//
//  Created by Kha-Yu Cheam on 11/9/20.
//

import SwiftUI

enum ViewState {
    case today
    case health
    case journal
    case profile
}

struct ContentView: View {
    @State private var viewState = 0
    
    var body: some View {
        TabView {
            TodayView().tabItem {
                Image(systemName: "calendar")
                Text("Today")
            }
            .tag(0)
            
            HealthView().tabItem {
                Image(systemName: "rectangle.3.offgrid")
                Text("Health")
            }
            .tag(1)
            
            JournalView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Journal")
            }
            .tag(2)
            
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("My Stats")
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
