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
    
    var body: some View {
        if !needsUserCreation {
            TabView {
                TodayView().tabItem{
                        Label("Today", systemImage: "calendar")
                    }
                    .tag(0)
                
                HealthView().tabItem{
                    Label("Health", systemImage: "rectangle.3.offgrid")
                }.tag(1)
                
                JournalView().tabItem{
                    Label("Journal", systemImage: "square.and.pencil")
                }.tag(2)
                
                ProfileView().tabItem {
                    Label("My Stats", systemImage: "person")
                }
            }
        } else {
            Onboarding()
                .edgesIgnoringSafeArea(.all)
                .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.primaryLight]), startPoint: .top, endPoint: .bottom))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
