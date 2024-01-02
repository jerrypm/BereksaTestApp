//
//  MainViewModel.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import DGCharts
import Foundation
import SwiftyJSON

class MainViewModel: NSObject {
    var arrayTime: [[String]] = []
    var productChartData: [[ChartDataEntry]] = []
    var lineChartData: LineChartData = .init()
    var bindCompareChartDataToController: (() -> ()) = {}
    var bindCompareProductsDataToController: (() -> ()) = {}
    private var apiService: APIService!

    private(set) var compareChartData: CompareChartModel! {
        didSet {
            setupDataChart()
            bindCompareChartDataToController()
        }
    }

    private(set) var compareProductData: CompareProductModel! {
        didSet {
            if compareProductData != nil {
                bindCompareProductsDataToController()
            }
        }
    }

    override init() {
        super.init()
        self.apiService = APIService()

        fetchChartData()
        fetchProductData()
    }

    func fetchChartData() {
        apiService.getChartData { result in
            switch result {
            case .success(let chart):
                self.compareChartData = chart

            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchProductData() {
        apiService.getProductData { result in
            switch result {
            case .success(let product):
                self.compareProductData = nil
                self.compareProductData = product
            case .failure(let error):
                print(error)
            }
        }
    }

    private func setupDataChart() {
        var entriesDataSet1 = [ChartDataEntry]()
        var entriesDataSet2 = [ChartDataEntry]()
        var entriesDataSet3 = [ChartDataEntry]()

        for pruductData in compareChartData.data {
            switch ChartType.fromString(pruductData.key) {
            case .lineType1:
                let data = pruductData.value.data
                entriesDataSet1 = configuredDataChart(data: data)
            case .lineType2:
                let data = pruductData.value.data
                entriesDataSet2 = configuredDataChart(data: data)
            case .lineType3:
                let data = pruductData.value.data
                entriesDataSet3 = configuredDataChart(data: data)
            default:
                break
            }
        }

        let dataSet1 = configureLineChartDataSet(entries: entriesDataSet1, label: "Data Line 1", color: .darkGreen)
        let dataSet2 = configureLineChartDataSet(entries: entriesDataSet2, label: "Data Line 2", color: .purple)
        let dataSet3 = configureLineChartDataSet(entries: entriesDataSet3, label: "Data Line 3", color: .navy)

        let data = LineChartData(dataSets: [dataSet1, dataSet2, dataSet3])
        lineChartData = data
    }

    private func configuredDataChart(data: [ChartData]) -> [ChartDataEntry] {
        var entriesDataSet = [ChartDataEntry]()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        for dataPoint in data {
            let dateString = dataPoint.date
            let growth = dataPoint.growth
            if let date = dateFormatter.date(from: dateString) {
                let year = Calendar.current.component(.year, from: date)
                entriesDataSet.append(ChartDataEntry(x: Double(year), y: growth))
            }
        }
        return entriesDataSet
    }

    private func configureLineChartDataSet(entries: [ChartDataEntry], label: String, color: UIColor) -> LineChartDataSet {
        let dataSet = LineChartDataSet(entries: entries, label: label)
        dataSet.drawCirclesEnabled = false
        dataSet.colors = [color]
        dataSet.lineWidth = 2.5
        dataSet.drawFilledEnabled = true
        dataSet.fillColor = NSUIColor.clear
        dataSet.drawCircleHoleEnabled = false
        return dataSet
    }
}
