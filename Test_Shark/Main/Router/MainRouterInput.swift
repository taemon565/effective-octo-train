//
//  mainmainRouterInput.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol MainRouterInput: AnyObject{
	func childChooseVC(with currencies: [String], selectedCurrency: String)
	func removeChild()
}
