//
//  mainmainViewOutput.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import Foundation

protocol MainViewOutput: AnyObject {
    func configureView()
    func checkDigits(str: String, char: String) -> Bool
    func childChooseVC(isFirst: Bool)
    func textFieldDidChange()
    func swipeCurrency()
}


