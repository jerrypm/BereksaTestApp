//
//  ChartTableViewCell.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import DGCharts
import SwiftyJSON
import UIKit

class ChartTableViewCell: UITableViewCell {
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var textGreen: UILabel!
    @IBOutlet weak var textPurple: UILabel!
    @IBOutlet weak var textBlue: UILabel!
    @IBOutlet weak var textDate: UILabel!

    var lineChart = LineChartView()
    var lineChartData: LineChartData = .init()

    private var chartValueFormatter: ChartValueFormatter? = ChartValueFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupChart()
    }

    private func setupChart() {
        lineChart.isUserInteractionEnabled = false
        lineChart.pinchZoomEnabled = false
        lineChart.doubleTapToZoomEnabled = false
        lineChart.legend.enabled = false
        lineChart.setVisibleXRangeMaximum(5)
        lineChart.drawBordersEnabled = false

        /// Keep this as an empty string because it will collide with the custom "No Chart Data" view
        lineChart.noDataText = ""
        lineChart.rightAxis.enabled = true
        lineChart.leftAxis.enabled = false

        lineChart.xAxis.enabled = true
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.drawGridLinesEnabled = false

        lineChart.rightAxis.drawGridLinesEnabled = true
        lineChart.rightAxis.drawAxisLineEnabled = false

        lineChart.rightAxis.valueFormatter = chartValueFormatter
        lineChart.rightAxis.labelTextColor = .gray
        lineChart.fitScreen()

        separatorInset = UIEdgeInsets(top: 0, left: frame.width, bottom: 0, right: 0)
    }
}

extension ChartTableViewCell: ChartViewDelegate {
    func setupChartView(lineChartData: LineChartData) {
        lineChart.data = lineChartData
        lineChart.frame = CGRect(x: chartView.frame.midX, y: chartView.frame.midY, width: chartView.frame.size.width, height: chartView.frame.size.height)
        lineChart.center = chartView.center
        chartView.addSubview(lineChart)
    }
}

class ChartValueFormatter: AxisValueFormatter {
    private let numberFormatters = NumberFormaters()

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let valueNSNumber = NSNumber(value: value)
        return numberFormatters.priceDecimalFormat(number: valueNSNumber)
    }
}
