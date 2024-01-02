//
//  InvesmentType.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import Foundation

enum InvestmentType {
    case pasarUang
    case pendapatanTetap
    case campuran
    case saham
    case unknown

    static func fromString(_ type: String) -> InvestmentType {
        switch type {
        case "Pasar Uang":
            return .pasarUang
        case "Pendapatan Tetap":
            return .pendapatanTetap
        case "Campuran":
            return .campuran
        case "Saham":
            return .saham
        default:
            return .unknown
        }
    }
}
