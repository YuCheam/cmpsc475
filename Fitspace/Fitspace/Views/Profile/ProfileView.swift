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
    
    @State var goalTitle = "Goal Title"
    @State var goalText = "text;lkajd dkei some more text and and"
    @State var showEditMenu = false
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    
    var body: some View {
        if user.count != 0 {
            NavigationView {
                ScrollView {
                    ProfileHeader(user: user[0])
                        .padding(.bottom, 24)
                    
                    NavigationLink(destination: AddEditGoal(user: user[0])){
                        Text("Add Goal +")
                            .modifier(ButtonStyle(ViewConstants.defaultButtonColor))
                    }.padding(.bottom, 12)
                    
                    VStack(spacing: 18) {
                        ForEach(Array(user[0].goals ?? [])) { goal in
                            NavigationLink(destination: AddEditGoal(goal: goal, user: user[0])) {
                                GoalComponent(user: user[0], goal: goal)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }.background(Color.offWhite)
                .edgesIgnoringSafeArea(.top)
                .navigationBarItems(leading: DeleteButton,
                                    trailing: EditProfileButton)
            }
        }
    }
    
    var EditProfileButton: some View {
        NavigationLink(destination: EditProfileView(user: user[0])){
            Text("Edit Profile →")
                .foregroundColor(.white)
        }
    }
    
    var DeleteButton: some View {
        Button("delete user"){
            for i in user {
                viewContext.delete(i)
            }

            do {
                try viewContext.save()
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }

            needsUserCreation = true
        }
    }
}

struct ProfileHeader: View {
    @ObservedObject var user: User
    var profileImageSize: CGFloat = 136
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Image(uiImage: user.image)
                    .resizable()
                    .frame(width: profileImageSize, height: profileImageSize)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    
                if user.profileImage == nil {
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .overlay(
                            Text("No profile image")
                                .foregroundColor(Color.white)
                        )
                }
            }.frame(width: profileImageSize, height: profileImageSize)
            
            VStack(alignment: .leading) {
                Text("\(user.firstName) \(user.lastName)")
                    .font(.system(size: ViewConstants.headingSize, weight: .bold, design: .default))
                Text("Current Weight: \(user.weight, specifier: "%.1f") lbs")
                Text("Height: \(user.healthStats.heightFormatted)")
                Text("Age: \(user.age)")
            }.foregroundColor(.white)
            
            
        }.frame(maxWidth: .infinity)
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 64)
        .padding(.bottom, 48)
        .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .top, endPoint: .bottom))
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
