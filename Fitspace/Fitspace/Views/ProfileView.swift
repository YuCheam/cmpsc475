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
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    
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
                        
                        //TODO: Remove once done with account deletion
                        if user.count != 0 {
                            let weight = Array(user[0].healthStats.weightHistory)[0]
                            VStack(alignment: .leading) {
                                Text("\(user[0].firstName)")
                                Text("\(user[0].lastName)")
                                Text("\(weight.amount)")
                                Text("\(user[0].healthStats.heightFormatted)")
                            }
                        }
                        
                        Spacer()
                    }.background(Color.gray)
                    
                    VStack {
//                        GoalComponent(title: $goalTitle , text: $goalText)
                        GoalComponent()
                    }.padding()
                    
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
