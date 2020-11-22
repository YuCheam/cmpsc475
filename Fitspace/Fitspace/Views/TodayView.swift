//
//  TodayView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/12/20.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var user: FetchedResults<User>
    
    var body: some View {
        Text("Today")
    }
}

//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayView()
//    }
//}
