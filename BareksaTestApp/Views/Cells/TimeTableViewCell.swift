//
//  TimeTableViewCell.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    @IBOutlet weak var timeStackView: UIStackView!
    @IBOutlet weak var lineView: UIView!

    var timeBtnArray: [UIButton] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTabBar()
    }

    private func setupTabBar() {
        lineView.backgroundColor = .lineIndicatorColor

        SC.timeFrameIndex = 2
        lineView.backgroundColor = .lineIndicatorColor
        for item in 0 ..< SC.timeFrame.count {
            let button = createButtonWith(title: SC.timeFrame[item], textColor: .textPrimary)
            button.tag = item
            button.addTarget(self, action: #selector(timeFrameBtnTapped(_:)), for: .touchUpInside)
            if item == SC.timeFrameIndex {
                button.setTitleColor(.buttonGreenColor, for: .normal)
            }
            timeBtnArray.append(button)
            timeStackView.addArrangedSubview(button)
        }
        DispatchQueue.main.async {
            self.setSelectedTimeFrameButton()
        }
    }

    private func setSelectedTimeFrameButton() {
        lineView.center.x = timeBtnArray[SC.timeFrameIndex].center.x
    }

    @objc func timeFrameBtnTapped(_ sender: UIButton) {
        if sender.tag != SC.timeFrameIndex {
            moveTimeFrameTo(index: sender.tag)
        }
    }

    func moveTimeFrameTo(index: Int) {
        timeBtnArray[SC.timeFrameIndex].setTitleColor(.textBlack, for: .normal)

        SC.timeFrameIndex = index
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseOut, animations: {
            self.setSelectedTimeFrameButton()
        }, completion: { _ in

        })

        #warning("here ")
//        setupDataToLineChart()
    }
}
