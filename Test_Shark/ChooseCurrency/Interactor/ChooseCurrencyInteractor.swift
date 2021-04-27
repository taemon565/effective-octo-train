//
//  ChooseCurrencyChooseCurrencyInteractor.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

class ChooseCurrencyInteractor {
	weak var output: ChooseCurrencyInteractorOutput?

	init(output: ChooseCurrencyInteractorOutput){
		self.output = output
	}
}

extension ChooseCurrencyInteractor: ChooseCurrencyInteractorInput{
	
}