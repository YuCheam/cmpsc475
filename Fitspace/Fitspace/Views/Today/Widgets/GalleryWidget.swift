//
//  GalleryWidget.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/12/20.
//

import SwiftUI

struct GalleryWidget: View {
    @ObservedObject var healthStats: HealthStats
    
    var images: [ProgressPic] {
        Array(Array(healthStats.images).sorted(by: {$0.date > $1.date}).prefix(3))
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .font(.system(size: 24, weight: .bold, design: .default))
            HStack(spacing: 4) {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: UIImage(data: image.imageData!)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 112, height: 112)
                        .cornerRadius(12)
                        .clipped()
                }
            }
        }.modifier(CardModifier())
    }
}

//struct GalleryWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryWidget()
//    }
//}
