//
//  CurrencyTableViewDataSource.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

final class CurrencyTableViewDataSource: NSObject, UITableViewDataSource {

	weak var output: CurrencyTableViewDataSourceOutput?

	init(output: CurrencyTableViewDataSourceOutput) {
		super.init()
		self.output = output
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		output?.numberOfRows() ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let output = output, let cell = tableView.dequeueReusableCell(withIdentifier: Cells.currency) as? CurrencyTableViewCell else { return UITableViewCell() }
		let currency = output.currency(index: indexPath.row)
		let selected = output.selected()
		cell.configureCell(name: currency, isSelected: currency == selected)
		return cell
	}


}
