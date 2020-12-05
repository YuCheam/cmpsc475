//
//  PhotosView.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI
import UIKit

struct PhotosView: View {
    @State var isShowingLibrary: Bool = false
    @State var image = UIImage()
    
    var body: some View {
        VStack {
            
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
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
            ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
        }
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
