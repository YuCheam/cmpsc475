//
//  XAxisExtension.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import Foundation
import Charts

class ChartXAxisFormatter: NSObject {
    var dateFormatter: DateFormatter?
    var referenceTimeInterval: TimeInterval?
    
    convenience init(referenceTimeInterval: TimeInterval, dateFormatter: DateFormatter) {
        self.init()
        self.referenceTimeInterval = referenceTimeInterval
        self.dateFormatter = dateFormatter
    }
}

extension ChartXAxisFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let dateFormatter = dateFormatter,
              let referenceTimeInterval = referenceTimeInterval
        else {
            return ""
        }
        
        let date = Date(timeIntervalSince1970: value*3600*24+referenceTimeInterval)
        return dateFormatter.string(from: date)
    }
}
