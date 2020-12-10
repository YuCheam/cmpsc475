//
//  PhotoPicker.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/9/20.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration
    @Binding var pickerResults: [UIImage]
    @Binding var isPresented: Bool
    
    typealias UIViewControllerType = PHPickerViewController
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        private let parent: PhotoPicker
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            for image in results {
                if image.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    image.itemProvider.loadObject(ofClass: UIImage.self) { (newImage, error) in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            self.parent.pickerResults.append(newImage as! UIImage)
                        }
                    }
                } else {
                    print("Loaded Assets is not Image")
                }
            }
            
            parent.isPresented = false
        }
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
    }
}
