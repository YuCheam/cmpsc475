//
//  ProfileView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("needsUserCreation") private var needsUserCreation: Bool = true
//    @Binding var needsUserCreation: Bool 
    @State var goalTitle = "Goal Title"
    @State var goalText = "text;lkajd dkei some more text and and"
    @State var showEditMenu = false
    
    //TODO: Add custom profile picture
    var profileImage = "emma_watson"
    
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    
    var body: some View {
        if user.count != 0 {
            NavigationView {
                ScrollView {
                    VStack {
                        HStack(spacing: 10) {
                            Image(profileImage)
                                .resizable()
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 164, height: 164)
                            
                            VStack(alignment: .leading) {
                                Text("\(user[0].firstName) \(user[0].lastName)")
                                Text("Current Weight: \(user[0].weight, specifier: "%.1f") lbs")
                                Text("Height: \(user[0].healthStats.heightFormatted)")
                                Text("Age: \(user[0].age)")
                            }
                            
                            Spacer()
                        }.background(Color.gray)
                        
                        VStack {
                            ForEach(Array(user[0].goals ?? [])) { goal in
                                NavigationLink(destination: AddEditGoal(goal: goal, user: user[0])) {
                                    GoalComponent(user: user[0], goal: goal)
                                }
                            }
                            
                            NavigationLink(destination: AddEditGoal(user: user[0])){
                                Text("Add Goal +")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 150, height: 50)
                                    .background(Color.green)
                                    .cornerRadius(15.0)
                            }
                        }.padding()
                    }
                }.navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $showEditMenu){
                    EditProfileView(user: user[0], sheet: $showEditMenu)
                }
                .toolbar(){
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Edit Profile") {
                            showEditMenu.toggle()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("delete user"){
                            for i in user {
                                viewContext.delete(i)
                            }
                            try? viewContext.save()
                            
                            needsUserCreation = true
                        }
                    }
                }
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
