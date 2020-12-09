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
        let chart: LineChartView = LineChartView()
        chart.data = addData()

        
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
        uiView.data = addData()
        uiView.notifyDataSetChanged()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func addData() -> LineChartData {
        
        let dataSet = LineChartDataSet(entries: entries, label: "Weights")
        dataSet.mode = .cubicBezier
        //dataSet.drawCirclesEnabled = false
        dataSet.lineWidth = 3
        
        return LineChartData(dataSet: dataSet)
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
