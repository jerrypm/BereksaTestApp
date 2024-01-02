//
//  Extension+UITableView.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(_ cell: T.Type) {
        let identifier = "\(cell)"
        register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let identifier = "\(cell)"
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error dequeueing cell")
        }
        return cell
    }
}

import DGCharts

extension LineChartView {
    
    private class LineChartFormatter: NSObject, AxisValueFormatter {
        var labels: [String] = []
                
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    func setLineChartData(xValues: [[String]], dataEntries: [[ChartDataEntry]], label: String) {
            
        var arrayDataSet: [LineChartDataSet] = []
        for i in 0..<dataEntries.count {
            let chartDataSet = LineChartDataSet(entries: dataEntries[i], label: "")
            chartDataSet.drawCirclesEnabled = false
            chartDataSet.mode = .cubicBezier
            chartDataSet.lineWidth = 2
            if i%3 == 0 {
                chartDataSet.setColor(.whiteGreen)
            } else if i%3 == 1 {
                chartDataSet.setColor(.whitePurple)
            } else {
                chartDataSet.setColor(.whiteBlue)
            }
            chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
            chartDataSet.drawVerticalHighlightIndicatorEnabled = true
            chartDataSet.highlightColor = .textPrimary
            chartDataSet.valueTextColor = .clear
            arrayDataSet.append(chartDataSet)
        }
        
        let chartData = LineChartData(dataSets: arrayDataSet)
        
        let chartFormatter = LineChartFormatter(labels: xValues.first ?? [])
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        
        self.data = chartData
    }

}

@objc(LineChartPercentFormatter)
public class LineChartPercentFormatter: NSObject, AxisValueFormatter{

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {

        return String(format: "%.0f %%", value)
    }
    
}
