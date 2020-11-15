//
//  Onboarding.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/15/20.
//

import SwiftUI

struct Onboarding: View {
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            Text("Create an account").tag(0)
            
            Text("First Name last Name").tag(1)
            
            Text("Health Information").tag(2)
            
            Text("Account being created").tag(3)
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
