//
//  ChooseCurrencyChooseCurrencyViewOutput.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol ChooseCurrencyViewOutput: AnyObject {
	func configureView()
	func updateCurrencies(with currencies: [String])
	func dismiss()
	func dismissWithOk()
}


