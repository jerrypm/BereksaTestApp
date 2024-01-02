//
//  Extension_Double.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import Foundation

extension Double {
    func getAmountDecimal() -> Double {
        if self >= 0 && self < 1000 {
            return self
        } else if self >= 1000 && self < 1000000 {
            return self / 1000
        } else if self >= 1000000 && self < 1000000000 {
            return self / 1000000
        } else if self >= 1000000000 && self < 1000000000000 {
            return self / 1000000000
        } else if self >= 1000000000000 {
            return self / 1000000000000
        } else {
            return self
        }
    }

    func getAmountPostfix() -> String {
        if self >= 0 && self < 1000 {
            return .empty
        } else if self >= 1000 && self < 1000000 {
            return "Ribu"
        } else if self >= 1000000 && self < 1000000000 {
            return "Juta"
        } else if self >= 1000000000 && self < 1000000000000 {
            return "Miliar"
        } else if self >= 1000000000000 {
            return "Triliun"
        } else {
            return .empty
        }
    }
}
