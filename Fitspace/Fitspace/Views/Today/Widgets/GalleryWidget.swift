//
//  GalleryWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct GalleryWidget: View {
    var body: some View {
        HStack {
            Text("Gallery Widget")
        }.modifier(CardModifier())
    }
}

struct GalleryWidget_Previews: PreviewProvider {
    static var previews: some View {
        GalleryWidget()
    }
}
