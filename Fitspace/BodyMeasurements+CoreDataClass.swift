//
//  BodyMeasurements+CoreDataClass.swift
//  Charts
//
//  Created by Kha-Yu Cheam on 12/2/20.
//
//

import Foundation
import CoreData

@objc(BodyMeasurements)
public class BodyMeasurements: NSManagedObject {
    lazy var stringDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        return dateFormatter.string(from: date)
    }()
}
