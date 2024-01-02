//
//  TabTableViewCell.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import UIKit

class TabTableViewCell: UITableViewCell {
    @IBOutlet weak var tabStackView: UIStackView!
    @IBOutlet weak var lineView: UIView!
    
    var currentTab = 0
    var btnArray: [UIButton] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTabBar()
        lineView.backgroundColor = .lineIndicatorColor
    }

    func setupTabBar() {
        for item in 0 ..< SC.tabBar.count {
            let button = createButtonWith(title: SC.tabBar[item], textColor: .textPrimary)
            button.tag = item
            button.addTarget(self, action: #selector(tabBarBtnTapped(_:)), for: .touchUpInside)
            if item == currentTab {
                button.setTitleColor(.lineIndicatorColor, for: .normal)
            }
            btnArray.append(button)
            tabStackView.addArrangedSubview(button)
        }
        DispatchQueue.main.async {
            self.lineView.center.x = self.btnArray[self.currentTab].center.x
        }
    }
    
    @objc func tabBarBtnTapped(_ sender: UIButton) {
        if sender.tag != currentTab {
            moveTabTo(index: sender.tag)
        }
    }
    
    private func moveTabTo(index: Int) {
        btnArray[index].setTitleColor(.yellowGreen, for: .normal)
        btnArray[currentTab].setTitleColor(.textPrimary, for: .normal)
    
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseOut, animations: {
            self.lineView.center.x = self.btnArray[index].center.x
        }, completion: { _ in
    
        })
        currentTab = index
    }
}
