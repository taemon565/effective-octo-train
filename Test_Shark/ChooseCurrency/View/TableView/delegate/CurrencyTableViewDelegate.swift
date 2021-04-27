//
//  CurrencyTableViewDelegate.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

/// Класс делегата таблицы
final class CurrencyTableViewDelegate: NSObject, UITableViewDelegate {

	weak var output: CurrencyTableViewDelegateOutput?

	init(output: CurrencyTableViewDelegateOutput) {
		super.init()
		self.output = output
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		output?.didSelectRow(index: indexPath.row)
	}

}
