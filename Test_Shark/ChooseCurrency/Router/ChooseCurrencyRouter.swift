//
//  ChooseCurrencyChooseCurrencyRouter.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import UIKit

class ChooseCurrencyRouter {
	weak var viewController: UIViewController?

	init(viewController: UIViewController) {
		self.viewController = viewController
	}
}

extension ChooseCurrencyRouter: ChooseCurrencyRouterInput {


}
