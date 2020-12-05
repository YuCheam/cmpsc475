//
//  ImagePicker2.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import SwiftUI
import UIKit
import Photos
import BSImagePicker


struct ImagePicker2: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = ImagePickerController()
        imagePicker.settings.theme.selectionStyle = .numbered
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        
        let start = Date()
        self.presentImagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        <#code#>
    }
}
