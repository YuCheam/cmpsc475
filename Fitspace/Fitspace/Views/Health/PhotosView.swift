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
    @State var imageSelection: [Bool] = []
    var configuration: PHPickerConfiguration
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        VStack {
            GeometryReader { geo in
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 6) {
//                        ForEach(imageSelection.indices, id: \.self) { index in
//                            ImageView(imageSelected: $imageSelection[index], image: healthStats.imageArray[index], size: geo.size.width/3)
//                                .onTapGesture {
//                                    self.imageSelection[index].toggle()
//                                }
//                        }
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
            PhotoPicker(configuration: configuration, isPresented: $isShowingLibrary, imageSelection: $imageSelection, healthStats: healthStats)
        }
    }
    
    init(healthStats: HealthStats) {
        self.configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        self.healthStats = healthStats
    }
}

struct ImageView: View {
    @Binding var imageSelected: Bool
    var image: UIImage
    var size: CGFloat
    var color: Color {
        imageSelected ? Color.blue : Color.clear
    }
    
    var body: some View {
        Image(uiImage: image)
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
