//
//  DataManager.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 24.04.2021.
//

import UIKit

protocol DataManagerServiceProtocol {
    func setCurrencyRates(currency: Currency)
    func getCurrencyRates(baseCode: String, completion: @escaping (_ needToUpdate: Bool, _ rates: [String: Double]) -> ())
}

final class DataManager: DataManagerServiceProtocol {
    
    private let userDefaults = UserDefaults.standard
    private let date = Date()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    func setCurrencyRates(currency: Currency) {
        if let baseCode = currency.base {
            userDefaults.setValue(currency.rates, forKey: baseCode)
            userDefaults.setValue(dateFormatter.string(from: currency.nextDate ?? date), forKey: "nextUpdate" + baseCode)
        }
    }
    
    func getCurrencyRates(baseCode: String, completion: @escaping (Bool, [String: Double]) -> ()) {
        if let rates = userDefaults.dictionary(forKey: baseCode) as? [String: Double],
           let nextDateUpdate = userDefaults.string(forKey: "nextUpdate" + baseCode) {
            completion((dateFormatter.date(from: nextDateUpdate) ?? date) <= date, rates)
        } else {
            completion(true, [:])
        }
    }
    
}
