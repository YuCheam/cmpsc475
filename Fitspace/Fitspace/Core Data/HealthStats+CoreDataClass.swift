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
    var weightEntries: [ChartDataEntry] = [ChartDataEntry]()
    var xAxisFormatter: ChartXAxisFormatter = ChartXAxisFormatter()
    
    // Body Measurement Bar Arrays
    var date: [String] = []
    var hipsEntries: [Double] = []
    var waistEntries: [Double] = []
    var thighEntries: [Double] = []
    var armEntries: [Double] = []
    var neckEntries: [Double] = []
    
    var imagesArray: [[ProgressPic]] = []
    
    var selectedImages: [ProgressPic] {
        Array(self.images).filter({$0.isSelected})
    }
    
    func setImagesArray() {
        // Get array of different dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        var array: [[ProgressPic]] = []
        
        var dates = Array(images).sorted(by: { $0.date > $1.date }).map({dateFormatter.string(from: $0.date)})
        
        // Preprocess dates to get unique dates
        var tempArray: [String] = []
        for i in 0..<dates.count {
            if !tempArray.contains(dates[i]) {
                tempArray.append(dates[i])
            }
        }
        dates = tempArray
        
        // For every unique date get images
        for date in dates {
            let imageArray = Array(images).filter({ image in
                dateFormatter.string(from: image.date) == date
            })
            array.append(imageArray)
        }
        
        self.imagesArray = array
    }
    
    func setBodyMeasurementArrays() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MM/dd"
        
        
        if let bodyMeasurements = self.bodyMeasurements {
            clearArrays()
            for measurement in Array(bodyMeasurements).sorted(by: {$0.date < $1.date}) {
                date.append(dateFormatter.string(from: measurement.date))
                hipsEntries.append(measurement.hips)
                waistEntries.append(measurement.waist)
                thighEntries.append(measurement.thigh)
                armEntries.append(measurement.arm)
                neckEntries.append(measurement.neck)
            }
        }
    }
    
    func clearArrays() {
        date.removeAll()
        hipsEntries.removeAll()
        waistEntries.removeAll()
        thighEntries.removeAll()
        armEntries.removeAll()
        neckEntries.removeAll()
    }
    
    //TODO: Create function to delete body measurement
    
    func updateWeightChartData() {
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
        
        self.weightEntries = entries
        self.xAxisFormatter = xValuesNumberFormatter
    }
    

    convenience init() {
        self.init()
        updateWeightChartData()
        setBodyMeasurementArrays()
    }
}
