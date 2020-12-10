//
//  ProgressPic+CoreDataClass.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData
import UIKit

@objc(ProgressPic)
public class ProgressPic: NSManagedObject {
    var image: UIImage {
        UIImage(data: imageData!) ?? UIImage()
    }
}
