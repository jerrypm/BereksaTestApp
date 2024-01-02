//
//  CompareChartModel.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import Foundation

struct CompareChartModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case code, message, error, data
        case totalData = "total_data"
    }

    var code: Int
    var message: String
    var error: String
    var data: [String: Charts]
    var totalData: Int
}

struct Charts: Decodable {
    var data: [ChartData]
    var error: String
}

struct ChartData: Decodable {
    var date: String
    var value: Double
    var growth: Double
}
