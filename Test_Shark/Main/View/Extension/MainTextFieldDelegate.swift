//
//  MainTextFieldDelegate.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

extension MainViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return output?.checkDigits(str: textField.text ?? "", char: string) ?? false
    }
    
}
