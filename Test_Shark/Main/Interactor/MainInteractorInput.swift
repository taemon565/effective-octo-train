//
//  mainmainInteractorInput.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol MainInteractorInput: AnyObject {
    func getCurrency(baseCode: String, completion: @escaping (Currency?, Errors?)->())
    func getLocalCurrency(baseCode: String, completion: @escaping (_ needToUpdate: Bool, _ rates: [String: Double]) -> ())
}
