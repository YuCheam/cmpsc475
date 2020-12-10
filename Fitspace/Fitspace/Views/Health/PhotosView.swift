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
    @State var isShowingLibrary: Bool = false
    @State var images: [UIImage] = []
    var configuration: PHPickerConfiguration
    
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                HStack {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
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
            PhotoPicker(configuration: configuration, pickerResults: $images, isPresented: $isShowingLibrary)
        }
    }
    
    init() {
        self.configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
