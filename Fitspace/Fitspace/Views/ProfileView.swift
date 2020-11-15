//
//  ProfileView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct ProfileView: View {
    var profileImage = "emma_watson"
    @State var goalTitle = "Goal Title"
    @State var goalText = "text;lkajd dkei some more text and and"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack(spacing: 10) {
                        Image(profileImage)
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 164, height: 164)
                        
                        VStack {
                            Text("First Name")
                            Text("Last Name")
                            Text("Weight: 135")
                            Text("Height: 5'5''")
                        }
                        
                        Spacer()
                    }.background(Color.gray)
                    
                    VStack {
                        GoalComponent(title: $goalTitle , text: $goalText)
                    }
                    
                    Spacer()
                }

            }.navigationBarTitleDisplayMode(.inline)
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add") {
                        // Edit profile information
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
