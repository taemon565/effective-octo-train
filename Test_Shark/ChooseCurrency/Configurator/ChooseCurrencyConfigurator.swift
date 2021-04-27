//
//  ChooseCurrencyChooseCurrencyConfigurator.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import UIKit

class ChooseCurrencyConfigurator: ChooseCurrencyConfiguratorProtocol {

	func configure(with viewController: ChooseCurrencyViewController) {
		let presenter = ChooseCurrencyPresenter(view: viewController)
		let interactor = ChooseCurrencyInteractor(output: presenter)
		let router = ChooseCurrencyRouter(viewController: viewController)

		viewController.output = presenter
		viewController.moduleInput = presenter
		presenter.interactor = interactor
		presenter.router = router

		let delegate = CurrencyTableViewDelegate(output: presenter)
		let dataSource = CurrencyTableViewDataSource(output: presenter)
		presenter.tableViewDelegate = delegate
		presenter.tableViewDataSource = dataSource
		viewController.customView.tableView.delegate = delegate
		viewController.customView.tableView .dataSource = dataSource
	}
}
