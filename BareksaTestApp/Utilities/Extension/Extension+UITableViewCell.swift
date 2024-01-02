//
//  Extension+UITableViewCell.swift
//  BareksaTestApp
//
//  Created by Jeri Purnama Maulid on 02/01/24.
//

import SDWebImage
import UIKit

extension UITableViewCell {
    func createButtonWith(title: String, textColor: UIColor, backgroundColor: UIColor = .white, borderWidth: CGFloat = 0, borderColor: UIColor = .white) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 4.0
        button.setTitle(title, for: .normal)

        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        return button
    }

    func addFundTo(stackView: UIStackView, value: ProductDetail, backgroundColor: UIColor) {
        let view = UIView()
        view.backgroundColor = backgroundColor

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        guard let imageURL = URL(string: value.imageAvatar) else {
            return
        }
        imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: SC.emptyImage.value))

        view.addSubview(imageView)

        NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 12.0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 12.0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40.0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 4.0
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        let attrString = NSMutableAttributedString(string: value.imageName)
        attrString.addAttribute(NSAttributedString.Key.kern, value: 1.25, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        view.addSubview(label)

        NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 12.0).isActive = true
        NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -12.0).isActive = true
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 10.0).isActive = true
        NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -12.0).isActive = true

        stackView.addArrangedSubview(view)
    }

    func addTextViewTo(stackView: UIStackView, value: String, backgroundColor: UIColor) {
        let textView = UITextView()
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.layer.cornerRadius = 4.0
        textView.backgroundColor = backgroundColor

        let attrString = NSMutableAttributedString(string: value)
        attrString.addAttribute(NSAttributedString.Key.kern, value: 1.25, range: NSMakeRange(0, attrString.length))
        textView.attributedText = attrString

        stackView.addArrangedSubview(textView)
    }
}
