//
//  CurrencyTableViewCell.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var selectedImageView: UIImageView!

	override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
	}

	func configureCell(name: String, isSelected: Bool = false) {
		nameLabel.text = name
		selectedImageView.image = isSelected ? UIImage(named: "selected") : UIImage(named: "deselect")
	}

}
