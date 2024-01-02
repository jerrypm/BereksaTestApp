//
//  ChartType.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import Foundation

enum ChartType {
    case lineType1
    case lineType2
    case lineType3
    case unknown

    static func fromString(_ type: String) -> ChartType {
        switch type {
        case "KI002MMCDANCAS00":
            return .lineType1
        case "NI002EQCDANSIE00":
            return .lineType2
        case "TP002EQCEQTCRS00":
            return .lineType3
        default:
            return .unknown
        }
    }
}
