//
//  String.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

extension String {
    func isDouble() -> Bool {
        guard let _ = Double(self.replacingOccurrences(of: ",", with: ".")) else { return false }
        return true
    }
}
