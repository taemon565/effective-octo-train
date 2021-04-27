//
//  mainmainConfigurator.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import UIKit

class MainConfigurator: MainConfiguratorProtocol {

	func configure(with viewController: MainViewController) {
		let presenter = MainPresenter(view: viewController)
		let interactor = MainInteractor(output: presenter)
		let router = MainRouter(viewController: viewController)
        
		viewController.output = presenter
		presenter.interactor = interactor
		presenter.router = router    
    }
}
