//
//  TodayView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var user: User
   
    var body: some View {
        NavigationView {
            VStack {
                ForEach(Array(user.widgets), id: \.self) { widget in
                    Text(widget.type)
                }
                NavigationLink(destination: AddWidgetView(user: user)){
                    Text("Add Widgets")
                }
            }
        }
    }
}

//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
