//
//  ComparePhotosView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/10/20.
//

import SwiftUI

struct ComparePhotosView: View {
    @ObservedObject var healthStats: HealthStats
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(healthStats.selectedImages, id: \.self) { image in
                        VStack {
                            Text(image.date.formattedDate)
                            Image(uiImage: UIImage(data: image.imageData!)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width - 28)
                        }
                    }
                }
            }
        }.navigationBarTitle("Compare Photos")
    }
}

//struct ComparePhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComparePhotosView()
//    }
//}
