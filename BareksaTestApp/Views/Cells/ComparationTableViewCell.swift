//
//  ComparationTableViewCell.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 01/01/24.
//

import UIKit

protocol CompareDelegate: AnyObject {
    func didAlertAction(message: String)
}

class ComparationTableViewCell: UITableViewCell {
    @IBOutlet weak var productStackView: UIStackView!
    @IBOutlet weak var productTypeStackView: UIStackView!
    @IBOutlet weak var returnStackView: UIStackView!
    @IBOutlet weak var danaStackView: UIStackView!
    @IBOutlet weak var minPurchaseStackView: UIStackView!
    @IBOutlet weak var termStackView: UIStackView!
    @IBOutlet weak var riskStackView: UIStackView!
    @IBOutlet weak var launchingStackView: UIStackView!
    @IBOutlet weak var detailBtnStackView: UIStackView!
    @IBOutlet weak var buyBtnStackView: UIStackView!

    weak var delegate: CompareDelegate?
    var compareProductData: CompareProductModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupDataToView() {
        for item in 0 ..< (compareProductData?.data.count ?? 0) {
            guard let itemData = compareProductData?.data[item] else { return }
            let backgroundColor: UIColor = item % 3 == 0 ? .whiteGreen : item % 3 == 1 ? .whitePurple : .whiteBlue

            addFundTo(stackView: productStackView, value: itemData.details, backgroundColor: backgroundColor)
            addTextViewTo(stackView: productTypeStackView, value: itemData.details.type, backgroundColor: backgroundColor)
            addTextViewTo(stackView: returnStackView, value: itemData.details.getReturnString(), backgroundColor: backgroundColor)
            addTextViewTo(stackView: danaStackView, value: itemData.details.getAumString(), backgroundColor: backgroundColor)
            addTextViewTo(stackView: minPurchaseStackView, value: itemData.details.getMinSubscriptionString(), backgroundColor: backgroundColor)
            addTextViewTo(stackView: termStackView, value: itemData.details.getTermString(), backgroundColor: backgroundColor)
            addTextViewTo(stackView: riskStackView, value: itemData.details.getRiskString(), backgroundColor: backgroundColor)
            addTextViewTo(stackView: launchingStackView, value: itemData.details.getInceptionDate(), backgroundColor: backgroundColor)

            let detailBtn = createButtonWith(title: SC.detail.value, textColor: .buttonGreenColor, borderWidth: 1.0, borderColor: .lineIndicatorColor)
            detailBtn.tag = item
            detailBtn.addTarget(self, action: #selector(detailTapped(_:)), for: .touchUpInside)
            detailBtnStackView.addArrangedSubview(detailBtn)

            let buyBtn = createButtonWith(title: SC.beli.value, textColor: .textBlack, backgroundColor: .buttonGreenColor)
            buyBtn.tag = item
            buyBtnStackView.addArrangedSubview(buyBtn)
        }
    }

    @objc func detailTapped(_ sender: UIButton) {
        let tag = sender.tag
        let code = compareProductData?.data[tag].code
        delegate?.didAlertAction(message: code ?? .empty)
    }
}
