//
//  User+CoreDataClass.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


@objc(User)
public class User: NSManagedObject {
    lazy var widgetArray: [Widget] = {
        Array(self.widgets).sorted(by: {$0.index < $1.index})
    }()
    
    lazy var _dob = {self.dob}()
    
    func setWidgetArray() {
        self.widgetArray = Array(self.widgets).sorted(by: {$0.index < $1.index})
    }
    
    func updateWidgetIndex() {
        for i in 0..<widgetArray.count {
            widgetArray[i].index = Int32(i)
        }
    }
    
    func containsWidget(_ type: WidgetType) -> Bool {
        widgetArray.contains(where: {$0.type == type.rawValue})
    }
}
