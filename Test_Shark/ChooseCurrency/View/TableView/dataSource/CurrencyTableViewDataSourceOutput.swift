//
//  CurrencyTableViewDataSourceOutput.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import Foundation

/// Протокол output кастомной DataSource
protocol CurrencyTableViewDataSourceOutput: AnyObject {
	func numberOfRows()-> Int
	func selected()->String?
	func currency(index: Int)-> String
}
