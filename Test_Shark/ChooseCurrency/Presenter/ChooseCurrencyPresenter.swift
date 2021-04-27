//
//  ChooseCurrencyChooseCurrencyPresenter.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol ChooseCurrencyModuleOutput: AnyObject {
	func dismiss()
	func dismiss(with currency: String)
}

protocol ChooseCurrencyModuleInput: AnyObject {
	func configure(with currencies: [String], selectedCurency: String?)
}

class ChooseCurrencyPresenter {

	weak var view: ChooseCurrencyViewInput?
	weak var moduleOutput: ChooseCurrencyModuleOutput?
	var router: ChooseCurrencyRouterInput?
	var interactor: ChooseCurrencyInteractorInput?
	var tableViewDelegate: CurrencyTableViewDelegate?
	var tableViewDataSource: CurrencyTableViewDataSource?
    
	private var currencies: [String] = [] {
		didSet {
			selectedCurrency = currencies.first
			updateTableView()
		}
	}
    
    private var selectedCurrency: String?


	init(view: ChooseCurrencyViewInput){
		self.view = view
	}

	private func updateTableView() {
		view?.updateTableView()
	}

	private func scrollTaleToSelected() {
		guard let selected = selectedCurrency, let index = currencies.firstIndex(of: selected) else { return }
		view?.scroolToSelected(index: index)
	}
}

extension ChooseCurrencyPresenter: ChooseCurrencyViewOutput {

	func configureView() {
		view?.setupView()
	}

	func updateCurrencies(with currencies: [String]) {
		self.currencies = currencies
	}

	func dismiss() {
		moduleOutput?.dismiss()
	}

	func dismissWithOk() {
		guard let selected = selectedCurrency else { moduleOutput?.dismiss(); return }
		moduleOutput?.dismiss(with: selected)
	}
}

extension ChooseCurrencyPresenter: ChooseCurrencyInteractorOutput {

}

//MARK: -TableViewDelegate+DataSource
extension ChooseCurrencyPresenter: CurrencyTableViewDelegateOutput {

	func didSelectRow(index: Int) {
		selectedCurrency = currencies[index]
		updateTableView()
	}
	
}

extension ChooseCurrencyPresenter: CurrencyTableViewDataSourceOutput {
	func numberOfRows()-> Int {
		currencies.count
	}

	func currency(index: Int)-> String {
		currencies[index]
	}

	func selected()->String? {
		selectedCurrency
	}
}

//MARK: -ModuleInput
extension ChooseCurrencyPresenter: ChooseCurrencyModuleInput {
	func configure(with currencies: [String], selectedCurency: String?) {
		view?.setupView()
		self.currencies = currencies
		self.selectedCurrency = selectedCurency
		scrollTaleToSelected()
	}
}
