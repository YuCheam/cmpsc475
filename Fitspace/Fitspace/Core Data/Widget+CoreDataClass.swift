//
//  Widget+CoreDataClass.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/11/20.
//
//

import Foundation
import CoreData

@objc(Widget)
public class Widget: NSManagedObject {
    var getState: WidgetType {
        WidgetType(rawValue: self.type)!
    }
}
