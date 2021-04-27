//
//  MainView.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 21.04.2021.
//

import UIKit

class MainView: UIView {
    
    //MARK: Outlets
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var firstSeparator: UIView!
    
    @IBOutlet var lastLabel: UILabel!
    @IBOutlet var lastTextField: UITextField!
    @IBOutlet var lastButton: UIButton!
    @IBOutlet var lastSeparator: UIView!
    
    @IBOutlet var swipeButton: UIButton!
    
    //MARK: Functions
    func configureUI() {
        //buttons
        firstButton.semanticContentAttribute = .forceRightToLeft
        firstButton.contentHorizontalAlignment = .right
        
        lastButton.semanticContentAttribute = .forceRightToLeft
        lastButton.contentHorizontalAlignment = .right
        
    }
}
