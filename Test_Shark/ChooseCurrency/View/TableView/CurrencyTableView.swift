//
//  CurrencyTableView.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

/// Таблица валют
final class CurrencyTableView: UITableView {

	override func awakeFromNib() {
		super.awakeFromNib()
		register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: Cells.currency)
		tableFooterView = UIView()
		separatorStyle = .none
		backgroundColor = .white
	}

}
