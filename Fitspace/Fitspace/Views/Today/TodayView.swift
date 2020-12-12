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
//                ForEach(user.widgetArray, id: \.self) { widget in
//                    Text(widget.type)
//                }
                
                WeightWidget(user: user, healthStats: user.healthStats)
                BodyMeasurementsWidget()
                GalleryWidget()
                MoodWidget()
                NavigationLink(destination: AddWidgetView(user: user)){
                    Text("Add Widgets")
                }
            }.padding(10)
        }
    }
}

//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
