//
//  Widget+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/11/20.
//
//

import Foundation
import CoreData

enum WidgetType: String, CaseIterable, Identifiable {
    case weight = "Weight"
    case bodyMeasurements = "Body Measurements"
    case gallery = "Gallery"
    case mood = "Mood"
    
    var id: String {
        self.rawValue
    }
}

extension Widget {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Widget> {
        return NSFetchRequest<Widget>(entityName: "Widget")
    }

    @NSManaged public var type: String
    @NSManaged public var isSelected: Bool
    @NSManaged public var user: User
    @NSManaged public var index: Int32

}

extension Widget : Identifiable {

}
