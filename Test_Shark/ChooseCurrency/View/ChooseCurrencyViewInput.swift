//
//  ChooseCurrencyChooseCurrencyViewInput.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol ChooseCurrencyViewInput: AnyObject {
	func updateTableView()
	func setupView()
	func scroolToSelected(index: Int)
}
