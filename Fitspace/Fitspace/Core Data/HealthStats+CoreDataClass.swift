//
//  HealthStats+CoreDataClass.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData
import Charts
import UIKit

@objc(HealthStats)
public class HealthStats: NSManagedObject {
    var entries: [ChartDataEntry] = [ChartDataEntry]()
    var xAxisFormatter: ChartXAxisFormatter = ChartXAxisFormatter()
    
    
    func updateDataEntries() {
        var referenceTimeInterval: TimeInterval = 0
        if let minTimeInterval  = (Array(weightHistory).map({$0.date.timeIntervalSince1970}).min()) {
            referenceTimeInterval = minTimeInterval
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MM/dd"
        
        let xValuesNumberFormatter = ChartXAxisFormatter(referenceTimeInterval: referenceTimeInterval, dateFormatter: dateFormatter)
        
        var entries = [ChartDataEntry]()
        for weight in Array(weightHistory).sorted(by: {$0.date < $1.date}) {
            let timeInterval = weight.date.timeIntervalSince1970
            let xValue = (timeInterval-referenceTimeInterval)/(3600*24)
            
            let yValue = weight.amount
            let entry = ChartDataEntry(x: xValue, y: Double(yValue))
            entries.append(entry)
        }
        
        self.entries = entries
        self.xAxisFormatter = xValuesNumberFormatter
    }
    
    convenience init() {
        self.init()
        updateDataEntries()
    }
}
