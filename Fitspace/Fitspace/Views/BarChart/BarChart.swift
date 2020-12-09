//
//  BarChart.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/8/20.
//

import Foundation
import Charts
import UIKit
import SwiftUI

struct BarChart: UIViewRepresentable {
    var wristMeasurements: [Double] = [5.0, 5.1, 4.9]
    var waistMeasurements: [Double] = [26.5, 27, 27.1]
    
    let dates = ["11/01", "11/20", "12/01"]
    
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        
        // legend formatting
        let legend = chart.legend
        legend.enabled = true
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.drawInside = true
        legend.yOffset = 10.0;
        legend.xOffset = 10.0;
        legend.yEntrySpace = 0.0;
        
        // X-Axis Formatting
        let xAxis = chart.xAxis
        xAxis.drawGridLinesEnabled = true
        xAxis.labelPosition = .bottom
        xAxis.centerAxisLabelsEnabled = true
        xAxis.valueFormatter = IndexAxisValueFormatter(values: self.dates)
        xAxis.granularity = 1
        
        // yAxis Formatting
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.maximumFractionDigits = 1
        
        let yAxis = chart.leftAxis
        yAxis.spaceTop = 0.35
        yAxis.axisMinimum = 0.0
        yAxis.drawGridLinesEnabled = false
        
        //chart animation
        chart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
        
        chart.data = addData(chart: chart)
        
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.data = addData(chart: uiView)
    }
    
    func addData(chart: BarChartView) -> BarChartData {
        var dataEntries1: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        
        for i in 0..<dates.count {
            let dataEntry1 = BarChartDataEntry(x: Double(i), y: wristMeasurements[i])
            let dataEntry2 = BarChartDataEntry(x: Double(i), y: waistMeasurements[i])
            
            dataEntries1.append(dataEntry1)
            dataEntries2.append(dataEntry2)
        }
        
        let barDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Wrist Measurement")
        let barDataSet2 = BarChartDataSet(entries: dataEntries2, label: "Waist Measurement")
        let dataSets = [barDataSet1, barDataSet2]
        
        let data = BarChartData(dataSets: dataSets)
        
        // Setting Grouping Settings
        // (0.3 + 0.05) * 2 + 0.3 = 1.0
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 0.3
        let groupCount = dates.count
        let startDate = 0
        
        data.barWidth = barWidth
        chart.xAxis.axisMinimum = Double(startDate)
        let gg = data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        chart.xAxis.axisMaximum = Double(startDate) + gg * Double(groupCount)
        data.groupBars(fromX: Double(startDate), groupSpace: groupSpace, barSpace: barSpace)
        chart.notifyDataSetChanged()
        
        return data
    }
    
    typealias UIViewType = BarChartView
}
