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
    
    var imageSize: CGFloat = 114
    
    
    var body: some View {
        VStack() {
            Text("Gallery")
                .font(.system(size: ViewConstants.headingSize, weight: .semibold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 4) {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: UIImage(data: image.imageData!)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: imageSize, height: imageSize)
                        .cornerRadius(10)
                        .clipped()
                }
            }.padding(.bottom, 8)
            
            if images.count == 0 {
                Text("No Images")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.modifier(CardModifier())
        
    }
}

//struct GalleryWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryWidget()
//    }
//}
