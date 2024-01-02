//
//  Constants.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import Foundation

typealias SC = StringConstant

enum StringConstant: String {
    // MARK: - Empty & symbol

    case empty = ""
    case space = " "
    case dash = "-"
    case dot = "."
    case coma = ","

    // MARK: - Keys

    // MARK: - Colors String

    case whiteBlue = "AzureishWhite"
    case whiteGreen = "ChineseWhite"
    case whitePurple = "Platinum"
    case lineIndicatorColor = "SapGreen"
    case buttonColor = "YellowGreen"
    case textPrimary = "TextBlack"
    case darkGreen = "DarkGreen"
    case navy = "Navy"
    case purple = "Purple"

    // MARK: - Images

    case emptyImage

    // MARK: - Other
    
    case detail = "Detail"
    case beli = "Beli"

    // MARK: - Array

    static let timeFrame = ["1W", "1M", "1Y", "3Y", "5Y", "10Y", "All"]
    static let tabBar = ["Imbal Hasil", "Dana Kelolaan"]
    static var timeFrameIndex = 2

    static let chartURL = "https://cb9dbfce-c5f3-4539-85ad-fa23da9713b0.mock.pstmn.io/takehometest/apps/compare/chart?productCodes=KI"
    static let productURL = "https://cb9dbfce-c5f3-4539-85ad-fa23da9713b0.mock.pstmn.io/takehometest/apps/compare/detail?productCodes=KI"

    var value: String {
        return rawValue
    }
}
