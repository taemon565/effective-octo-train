//
//  mainmainViewController.swift
//  Test_Shark
//
//  Created by Vadim on 21/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var customView: MainView!
    
    
    //MARK: Properties
	var output: MainViewOutput?
	var configurator: MainConfiguratorProtocol = MainConfigurator()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Life circle controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        
        output?.configureView()
        customView.configureUI()
	}
    
    //MARK: objc functions
    @objc func textFieldDidChange(sender: UITextField) {
        output?.textFieldDidChange()
    }
    
    //MARK: Actions
    @IBAction func tappedChooseCurrency(_ sender: UIButton) {
		output?.childChooseVC(isFirst: sender == customView.firstButton)
    }
    
    @IBAction func swipeCurrency(_ sender: UIButton) {
        swipeTextField()
        output?.swipeCurrency()
    }
    
    private func swipeTextField() {
        let tmp = customView.firstTextField.text
        customView.firstTextField.text = customView.lastTextField.text
        customView.lastTextField.text = tmp
    }
}

extension MainViewController: MainViewInput {
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func recalculateCurrency(ratio: Double) {
        customView.lastTextField.text = Double(customView.firstTextField.text ?? "") == nil ? "" : "\(Double(customView.firstTextField.text ?? "")! * ratio)"
    }
    
    func configureTextFields() {
        customView.firstTextField.delegate = self
        customView.lastTextField.delegate = self
        
        customView.firstTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        customView.lastTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    func configureView() {
        customView.configureUI()
        addTapGestureToHideKeyboard()
    }

	func updateFirstButton(with title: String) {
		customView.firstButton.setTitle(title, for: .normal)
	}

	func updateLastButton(with title: String) {
		customView.lastButton.setTitle(title, for: .normal)
	}

}
