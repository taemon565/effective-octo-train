//
//  ChooseCurrencyView.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 22.04.2021.
//

import UIKit

class ChooseCurrencyView: UIView {
    
    //MARK: Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    //MARK: Functions
    func configureUI() {
        //mainView view
        mainView.layoutIfNeeded() 
        mainView.clipsToBounds = false
        mainView.layer.masksToBounds = false
        
        mainView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        mainView.layer.shadowRadius = 15
        mainView.layer.shadowOpacity = 0.40
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowOffset = .zero
        let cgPath = UIBezierPath(roundedRect: CGRect(x: -5, y: -5,
                                                      width: mainView.frame.width + 10, height: mainView.frame.height + 25),
                                  cornerRadius: 10).cgPath
        mainView.layer.shadowPath = cgPath
        
        //top and bot view
        topView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        topView.layer.cornerRadius = 10
        topView.clipsToBounds = true
        
        bottomView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        bottomView.layer.cornerRadius = 10
        bottomView.clipsToBounds = true
    }
}
