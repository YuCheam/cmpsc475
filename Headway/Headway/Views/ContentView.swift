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
    @State private var viewState: ViewState = .today
    var body: some View {
        TabView {
            TodayView().tabItem {
                Image(systemName: "calendar")
                Text("Today")
            }
            .tag(ViewState.today)
            
            HealthView().tabItem {
                Image(systemName: "rectangle.3.offgrid")
                Text("Health")
            }
            .tag(ViewState.health)
            
            JournalView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Journal")
            }
            .tag(ViewState.journal)
            
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("My Stats")
            }
            .tag(ViewState.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
