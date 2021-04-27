
//
//  Currency.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import Foundation

struct Currency: Codable {
	var lastUpdate: Double?
	var nextUpdate: Double?
	var base: String?
	var rates: [String: Double] = [:]

	var lastDate: Date? {
		get {
			guard let unixDate = lastUpdate else { return nil}
			return Date(timeIntervalSince1970: unixDate)
		}
	}

	var nextDate: Date? {
		get {
			guard let unixDate = nextUpdate else { return nil}
            return Date(timeIntervalSince1970: unixDate + Double.random(in: 30..<300))
		}
	}

	enum CodingKeys: String, CodingKey {
		case lastUpdate = "time_last_update_unix"
		case nextUpdate = "time_next_update_unix"
		case base = "base_code"
		case rates
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.lastUpdate = try? container.decode(Double.self, forKey: .lastUpdate)
		self.nextUpdate = try? container.decode(Double.self, forKey: .nextUpdate)
		self.base = try? container.decode(String.self, forKey: .base)
		guard let rates = try? container.decode([String:Double].self, forKey: .rates) else { return }
		self.rates = rates
	}

}
