//
//  NumberFormatters.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import Foundation

public class NumberFormaters {
    lazy var priceNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = .coma
        numberFormatter.decimalSeparator = .dot
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfEven
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter
    }()

    public init() {}

    public func priceDecimalFormat(number: NSNumber) -> String {
        return priceNumberFormatter.string(from: number) ?? String.empty
    }
}
