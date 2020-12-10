//
//  PhotoPicker.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/9/20.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Environment(\.managedObjectContext) private var viewContext
    
    let configuration: PHPickerConfiguration
    @Binding var isPresented: Bool
    @Binding var imageSelection: [Bool]
    var healthStats: HealthStats
    
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
    
    func addImage(image: UIImage) {
        let newProgressPic = ProgressPic(context: viewContext)
        newProgressPic.date = Date()
        //newProgressPic.imageData = image.jpegData(compressionQuality: 1.0)
        
        healthStats.addToImages(newProgressPic)
        DispatchQueue.main.sync {
            do {
                try viewContext.save()
            } catch {
                print("Images could not be created")
            }
        }
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
                            self.parent.addImage(image: newImage as! UIImage)
                            self.parent.imageSelection.append(false)
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
