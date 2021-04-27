//
//  mainmainInteractor.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

final class MainInteractor {
	weak var output: MainInteractorOutput?
	var inet: CurrencyConverterServiceProtocol
    var dataManager: DataManagerServiceProtocol

    init(output: MainInteractorOutput,
         inet: CurrencyConverterServiceProtocol = CurrencyConverterService(),
         dataManager: DataManager = DataManager()){
		self.output = output
		self.inet = inet
        self.dataManager = dataManager
	}
}

extension MainInteractor: MainInteractorInput{
    func getLocalCurrency(baseCode: String, completion: @escaping (Bool, [String : Double]) -> ()) {
        dataManager.getCurrencyRates(baseCode: baseCode) { (needToUpdate, rates) in
            completion(needToUpdate, rates)
        }
    }
    
    func getCurrency(baseCode: String, completion: @escaping (Currency?, Errors?)->()) {
        inet.getCurrency(baseCode: baseCode) { [weak self] currency, errorStatus  in
            if let currency = currency {
                self?.dataManager.setCurrencyRates(currency: currency)
            }
			completion(currency, errorStatus)
		}
	}
}
