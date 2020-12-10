//
//  PhotosView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI
import UIKit
import PhotosUI

struct PhotosView: View {
    @ObservedObject var healthStats: HealthStats
    @State var isShowingLibrary: Bool = false
    var configuration: PHPickerConfiguration
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack {
            GeometryReader { geo in
                ScrollView(){
                    ForEach(healthStats.imagesArray, id:\.self) { array in
                        Text(array[0].date.formattedDate)
                        LazyVGrid(columns: columns, spacing: 6) {
                            ForEach(array, id:\.self) { image in
                                ImageView(image: image, size: geo.size.width/3)
                                    .onTapGesture {
                                        image.isSelected.toggle()
                                    }
                            }
                        }
                    }
                }.padding(4)
            }
            
            Button(action: {
                self.isShowingLibrary = true
            }) {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Photo library")
                        .font(.headline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }.sheet(isPresented: $isShowingLibrary) {
            PhotoPicker(configuration: configuration, isPresented: $isShowingLibrary, healthStats: healthStats)
        }
    }
    
    func getUIImage(_ data: Data) -> UIImage {
        UIImage(data: data)!
    }
    
    init(healthStats: HealthStats) {
        self.configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        self.healthStats = healthStats
    }
}

struct ImageView: View {
    @ObservedObject var image: ProgressPic
    var size: CGFloat
    var color: Color {
        image.isSelected ? Color.blue : Color.clear
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: image.imageData!)!)
            .resizable()
            .frame(width: size, height: size)
            .border(color, width: 2)
    }
}

//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView()
//    }
//}
