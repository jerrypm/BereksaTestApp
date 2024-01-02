//
//  Extension+String.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import Foundation

extension String {
    static var empty: String {
        return SC.empty.value
    }

    static var space: String {
        return SC.space.value
    }

    static var dash: String {
        return SC.dash.value
    }

    static var dot: String {
        return SC.dot.value
    }

    static var coma: String {
        return SC.coma.value
    }

    func formatStringToDate(timeFrameIndex: Int) -> String {
        let arrDate = components(separatedBy: String.dash)
        let year = arrDate[0].suffix(2)
        let month = arrDate[1]
        let day = arrDate[2]

        switch timeFrameIndex {
        case 0, 1: return day + String.space + month.formatMonthToString()
        case 2, 3, 4, 5: return month.formatMonthToString() + String.space + year
        default: return month.formatMonthToString() + String.space + year
        }
    }

    func formatMonthToString() -> String {
        switch self {
        case "01": return "Jan"
        case "02": return "Feb"
        case "03": return "Mar"
        case "04": return "Apr"
        case "05": return "Mei"
        case "06": return "Jun"
        case "07": return "Jul"
        case "08": return "Agu"
        case "09": return "Sep"
        case "10": return "Okt"
        case "11": return "Nov"
        case "12": return "Des"
        default: return ""
        }
    }
}
