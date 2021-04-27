//
//  mainmainRouter.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import UIKit

class MainRouter {
	weak var viewController: UIViewController?

	init(viewController: UIViewController) {
		self.viewController = viewController
	}
}

extension MainRouter: MainRouterInput {

	func removeChild() {
		viewController?.remove()
	}

	func childChooseVC(with currencies: [String], selectedCurrency: String) {
		let storyboard = UIStoryboard(name: "ChooseCurrency", bundle: nil)
		if let nextVC = storyboard.instantiateViewController(withIdentifier: String(describing: ChooseCurrencyViewController.self)) as? ChooseCurrencyViewController {
			viewController?.add(nextVC)
			let configurator = ChooseCurrencyConfigurator()
			configurator.configure(with: nextVC)
			(nextVC.output as? ChooseCurrencyPresenter)?.moduleOutput = (viewController as? MainViewController)?.output as? MainPresenter
			nextVC.moduleInput?.configure(with: currencies, selectedCurency: selectedCurrency)
		}
	}

}
