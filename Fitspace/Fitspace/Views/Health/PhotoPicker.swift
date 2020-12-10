//
//  PhotoPicker.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/9/20.
//

import SwiftUI
import PhotosUI

struct PhotoPickerWrapper: View {
    let configuration: PHPickerConfiguration
    @ObservedObject var healthStats: HealthStats
    
    var body: some View {
        PhotoPicker(configuration: configuration, healthStats: healthStats)
            .navigationBarHidden(true)
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let configuration: PHPickerConfiguration
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
        newProgressPic.imageData = image.jpegData(compressionQuality: 1.0)
        newProgressPic.isSelected = false
        
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
                        }
                    }
                } else {
                    print("Loaded Assets is not Image")
                }
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
    }
}
