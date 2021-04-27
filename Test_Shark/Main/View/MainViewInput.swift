//
//  mainmainViewInput.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol MainViewInput: AnyObject {
    func configureView()
    func configureTextFields()
	func updateFirstButton(with title: String)
	func updateLastButton(with title: String)
    func recalculateCurrency(ratio: Double)
    func showErrorAlert(title: String, message: String)
}
