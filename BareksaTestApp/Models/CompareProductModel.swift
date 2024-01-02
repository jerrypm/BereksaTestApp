//
//  CompareProductModel.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import Foundation

struct CompareProductModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case code, message, error, data
    }

    var code: Int
    var message: String
    var error: String
    var data: [ProductData]
}

struct ProductData: Decodable {
    enum CodingKeys: String, CodingKey {
        case code, name, details
    }

    var code: String
    var name: String
    var details: ProductDetail
}

struct ProductDetail: Decodable {
    enum CodingKeys: String, CodingKey {
        case category, currency, custody, nav, type
        case categoryId = "category_id"
        case inceptionDate = "inception_date"
        case imageAvatar = "im_avatar"
        case imageName = "im_name"
        case minBalance = "min_balance"
        case minRedemption = "min_redemption"
        case minSubscription = "min_subscription"
        case returnCurYear = "return_cur_year"
        case returnOneDay = "return_one_day"
        case returnOneWeek = "return_one_week"
        case returnOneMonth = "return_one_month"
        case returnThreeMonth = "return_three_month"
        case returnSixMonth = "return_six_month"
        case returnOneYear = "return_one_year"
        case returnTwoYear = "return_two_year"
        case returnThreeYear = "return_three_year"
        case returnFourYear = "return_four_year"
        case returnFiveYear = "return_five_year"
        case returnInceptionGrowth = "return_inception_growth"
        case totalUnit = "total_unit"
        case typeId = "type_id"
    }

    var category: String
    var categoryId: Int
    var currency: String
    var custody: String
    var inceptionDate: String
    var imageAvatar: String
    var imageName: String
    var minBalance: Double
    var minRedemption: Double
    var minSubscription: Double
    var nav: Double
    var returnCurYear: Double
    var returnOneDay: Double
    var returnOneWeek: Double
    var returnOneMonth: Double
    var returnThreeMonth: Double
    var returnSixMonth: Double
    var returnOneYear: Double
    var returnTwoYear: Double
    var returnThreeYear: Double
    var returnFourYear: Double
    var returnFiveYear: Double
    var returnInceptionGrowth: Double
    var totalUnit: Double
    var type: String
    var typeId: Int

    func getReturnString() -> String {
        switch InvestmentType.fromString(self.type) {
            case .pasarUang:
                return String(format: "%.2f", self.returnOneYear).replacingOccurrences(of: ".", with: ",") + "% / thn"
            case .pendapatanTetap, .campuran:
                return String(format: "%.2f", self.returnThreeYear).replacingOccurrences(of: ".", with: ",") + "% / 3 thn"
            case .saham:
                return String(format: "%.2f", self.returnFiveYear).replacingOccurrences(of: ".", with: ",") + "% / 5 thn"
            case .unknown:
                return .empty
        }
    }

    func getAumString() -> String {
        let aumValue = self.totalUnit * self.nav
        return String(format: "%.2f %@", aumValue.getAmountDecimal(), aumValue.getAmountPostfix()).replacingOccurrences(of: ".", with: ",")
    }

    func getMinSubscriptionString() -> String {
        return String(format: "%.0f %@", self.minSubscription.getAmountDecimal(), self.minSubscription.getAmountPostfix())
    }

    func getTermString() -> String {
        switch InvestmentType.fromString(self.type) {
            case .pasarUang:
                return "1 Tahun"
            case .pendapatanTetap, .campuran:
                return "3 Tahun"
            case .saham:
                return "5 Tahun"
            case .unknown:
                return .empty
        }
    }

    func getRiskString() -> String {
        switch InvestmentType.fromString(self.type) {
            case .pasarUang:
                return "Rendah"
            case .pendapatanTetap, .campuran:
                return "Sedang"
            case .saham:
                return "Tinggi"
            case .unknown:
                return .empty
        }
    }

    func getInceptionDate() -> String {
        let dateArray = self.inceptionDate.split(separator: "-")
        return dateArray[2] + String.space + String(dateArray[1]).formatMonthToString() + String.space + dateArray[0]
    }
}
