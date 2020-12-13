//
//  ContentView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("needsUserCreation") private var needsUserCreation: Bool = true
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    @State var currentTab: Int = 0
    @State var viewMode: HealthViewState = .weight
    
    var body: some View {
        if !needsUserCreation {
            if user.count != 0 {
                TabView(selection: $currentTab) {
                    TodayView(user: user[0], tabIndex: $currentTab, viewMode: $viewMode).tabItem{
                            Label("Today", systemImage: "calendar")
                        }
                        .tag(0)
                    
                    HealthView(healthStats: user[0].healthStats, viewMode: $viewMode).tabItem{
                        Label("Health", systemImage: "rectangle.3.offgrid")
                    }.tag(1)
                    
                    JournalView(user: user[0], journal: user[0].journal).tabItem{
                        Label("Journal", systemImage: "square.and.pencil")
                    }.tag(2)
                    
                    ProfileView().tabItem {
                        Label("My Stats", systemImage: "person")
                    }
                }
            }
        } else {
            Onboarding()
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
