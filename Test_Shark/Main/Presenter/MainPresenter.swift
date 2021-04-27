//
//  mainmainPresenter.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

final class MainPresenter {

    weak var view: MainViewInput?
	var router: MainRouterInput?
	var interactor: MainInteractorInput?
    
	private var currencies: [String] = []
	private var isChangingFirstCurrency: Bool = true
    
	private var firstValue: String = "RUB" {
		didSet {
			checkCurrency(baseCode: firstValue)
			view?.updateFirstButton(with: firstValue)
		}
	}

	private var secondValue: String = "EUR" {
		didSet {
            checkCurrency(baseCode: firstValue)
			view?.updateLastButton(with: secondValue)
		}
	}

	private var currency: Currency? {
		didSet {
			guard let currency = currency else { return }
			var currencies: [String] = []
			currency.rates.forEach { (keys, _) in currencies.append(keys) }
			self.currencies = currencies.sorted()
		}
	}

	init(view: MainViewInput){
		self.view = view
	}
    
    private func checkCurrency(baseCode: String) {
        interactor?.getLocalCurrency(baseCode: baseCode, completion: { [weak self] (needToUpdate, rates) in
            if needToUpdate {
                self?.interactor?.getCurrency(baseCode: baseCode, completion: { [weak self] (currency, errorStatus)  in
                    self?.currency = currency
                    self?.checkError(errorStatus: errorStatus)
                    if let secondBaseCode = self?.secondValue,
                       let ratio = currency?.rates[secondBaseCode] {
                        self?.view?.recalculateCurrency(ratio: ratio)
                    }
                })
            } else {
                if let secondBaseCode = self?.secondValue,
                   let ratio = rates[secondBaseCode] {
                    self?.view?.recalculateCurrency(ratio: ratio)
                }
            }
        })
    }
    
    private func checkError(errorStatus: Errors?) {
        if let errorStatus = errorStatus,
           errorStatus == .failure {
            view?.showErrorAlert(title: "Произошла ошибка", message: "Проверьте подключение к интернету")
        }
    }
}

extension MainPresenter: MainViewOutput {
    
    func swipeCurrency() {
        let tmp = secondValue
        secondValue = firstValue
        firstValue = tmp
    }
    
    func textFieldDidChange() {
        checkCurrency(baseCode: firstValue)
    }
    
	func childChooseVC(isFirst: Bool) {
		isChangingFirstCurrency = isFirst
		router?.childChooseVC(with: currencies, selectedCurrency: isChangingFirstCurrency ? firstValue : secondValue)
    }
    
    func configureView() {
        view?.configureView()
        view?.configureTextFields()
        interactor?.getCurrency(baseCode: firstValue) { [weak self] currncy, errorStatus  in
			self?.currency = currncy
            self?.checkError(errorStatus: errorStatus)
		}
    }
    
    func checkDigits(str: String, char: String) -> Bool {
        let trimmedString = char.replacingOccurrences(of: "\\D\\g", with: "", options: .regularExpression)
        let newStr = str + char
        return (trimmedString != "" || char.isEmpty) && newStr.isDouble()
    }
}

extension MainPresenter: MainInteractorOutput {

}

//MARK: -ChooseCurrencyModuleOutput
extension MainPresenter: ChooseCurrencyModuleOutput {
	func dismiss() {
		router?.removeChild()
	}

	func dismiss(with currency: String) {
		if isChangingFirstCurrency {
			firstValue = currency
		} else {
			secondValue = currency
		}
		router?.removeChild()
	}


}
