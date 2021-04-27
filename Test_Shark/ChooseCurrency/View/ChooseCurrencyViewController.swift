//
//  ChooseCurrencyChooseCurrencyViewController.swift
//  Test_Shark
//
//  Created by Vadim on 22/04/2021.
//  Copyright © 2021 Vadim_Presnov. All rights reserved.
//

import UIKit

class ChooseCurrencyViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var customView: ChooseCurrencyView!
    
    
    //MARK: Properties
	weak var moduleInput: ChooseCurrencyModuleInput?
	var output: ChooseCurrencyViewOutput?

    //MARK: Life circle controller
    override func viewDidLoad() {
        super.viewDidLoad()
	}

	private func setupCancelButton() {
		customView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
	}

	private func setupSaveButton() {
		customView.saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
	}

	@objc private func didTapCancelButton() {
		output?.dismiss()
	}

	@objc private func didTapSaveButton() {
		output?.dismissWithOk()
	}
}

extension ChooseCurrencyViewController: ChooseCurrencyViewInput {
	func setupView() {
		customView.configureUI()
		setupCancelButton()
		setupSaveButton()
	}

	func updateTableView() {
		customView.tableView.reloadData()
	}

	func scroolToSelected(index: Int) {
		customView.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .middle, animated: false)
	}

}
