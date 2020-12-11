//
//  PhotoMenu.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/10/20.
//

import SwiftUI

struct PhotoMenu: View {
    @ObservedObject var healthStats: HealthStats
    
    var body: some View {
        ActionSheet(title: Text("Edit"), buttons: [
            .destructive(Text("Delete")){},
            .default(Text("Compare Photos")),
            .default(Text("Change Date")),
                .default(Text("Dismiss"))
        ])
    }
}

struct PhotoMenu_Previews: PreviewProvider {
    static var previews: some View {
        PhotoMenu()
    }
}
