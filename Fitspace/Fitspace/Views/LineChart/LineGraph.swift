//
//  WeightChart.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/5/20.
//

import Charts
import SwiftUI
import UIKit

struct LineGraph: UIViewRepresentable {
    var entries: [ChartDataEntry]
    var xAxisFormatter: ChartXAxisFormatter
    
    
    func makeUIView(context: Context) -> LineChartView  {
        let set1 = LineChartDataSet(entries: entries, label: "Weights")
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 3
        
        let data = LineChartData(dataSet: set1)
        let chart: LineChartView = LineChartView()
        
        chart.data = data
        chart.backgroundColor = UIColor(Color.blue)
        
        // Customization of Chart
        chart.rightAxis.enabled = false
        let yAxis = chart.leftAxis
        yAxis.setLabelCount(8, force: false)
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        chart.xAxis.valueFormatter = xAxisFormatter
        chart.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chart.xAxis.labelTextColor = .white
        chart.xAxis.axisLineColor = .white
        chart.xAxis.granularity = 1
        chart.xAxis.labelPosition = .bottom
        
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        var parent: LineGraph
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            print(entry)
        }
        
        init(_ parent: LineGraph) {
            self.parent = parent
        }
    }
}


//struct LineGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraph()
//    }
//}
