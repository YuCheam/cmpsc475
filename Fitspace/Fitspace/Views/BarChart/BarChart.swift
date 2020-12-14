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
    var healthStats: HealthStats
    var dates: [String]
    var hipMeasurements: [Double]
    var waistMeasurements: [Double]
    var thighMeasurements: [Double]
    var armMeasurements: [Double]
    var neckMeasurements: [Double]

    
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        //chart.setScaleEnabled(true)
        
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
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.centerAxisLabelsEnabled = true
        xAxis.valueFormatter = IndexAxisValueFormatter(values: self.dates)
        xAxis.granularity = 1
        
        // yAxis Formatting
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.maximumFractionDigits = 1
        
        let yAxis = chart.leftAxis
        yAxis.spaceTop = 0.35
        yAxis.axisMinimum = 0.0
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.drawGridLinesEnabled = false
        
        //chart animation
        chart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
        
        chart.data = addData(chart: chart)
        
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.data = addData(chart: uiView)
        uiView.notifyDataSetChanged()
    }
    
    func addData(chart: BarChartView) -> BarChartData {
        var dataEntries1: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        var dataEntries3: [BarChartDataEntry] = []
        var dataEntries4: [BarChartDataEntry] = []
        var dataEntries5: [BarChartDataEntry] = []
        
        for i in 0..<dates.count {
            let dataEntry1 = BarChartDataEntry(x: Double(i), y: neckMeasurements[i])
            let dataEntry2 = BarChartDataEntry(x: Double(i), y: armMeasurements[i])
            let dataEntry3 = BarChartDataEntry(x: Double(i), y: waistMeasurements[i])
            let dataEntry4 = BarChartDataEntry(x: Double(i), y: hipMeasurements[i])
            let dataEntry5 = BarChartDataEntry(x: Double(i), y: thighMeasurements[i])
            
            dataEntries1.append(dataEntry1)
            dataEntries2.append(dataEntry2)
            dataEntries3.append(dataEntry3)
            dataEntries4.append(dataEntry4)
            dataEntries5.append(dataEntry5)
        }
        
        let barDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Neck")
        let barDataSet2 = BarChartDataSet(entries: dataEntries2, label: "Arm")
        let barDataSet3 = BarChartDataSet(entries: dataEntries3, label: "Waist")
        let barDataSet4 = BarChartDataSet(entries: dataEntries4, label: "Hip")
        let barDataSet5 = BarChartDataSet(entries: dataEntries5, label: "Thigh")
        let dataSets = [barDataSet1, barDataSet2, barDataSet3, barDataSet4, barDataSet5]
        barDataSet1.setColor(.systemBlue)
        barDataSet2.setColor(.systemTeal)
        barDataSet3.setColor(.systemGreen)
        barDataSet4.setColor(.systemYellow)
        barDataSet5.setColor(.systemOrange)
        
        let data = BarChartData(dataSets: dataSets)
        
        
        // Setting Grouping Settings
        // groupWidth (1) = n * (barWidth + barSpace) + groupSpace
        let groupSpace = 0.155
        let barSpace = 0.015
        let barWidth = 0.15
        
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
    
    init(healthStats: HealthStats) {
        self.healthStats = healthStats
        self.dates = healthStats.date
        self.hipMeasurements = healthStats.hipsEntries
        self.waistMeasurements = healthStats.waistEntries
        self.thighMeasurements = healthStats.thighEntries
        self.armMeasurements = healthStats.armEntries
        self.neckMeasurements = healthStats.neckEntries
    }
    
    typealias UIViewType = BarChartView
}
