//
//  CurrencyTableViewDelegateOutput.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import Foundation

/// Протокол делегата таблицы
protocol CurrencyTableViewDelegateOutput: AnyObject {
	func didSelectRow(index: Int)
}
