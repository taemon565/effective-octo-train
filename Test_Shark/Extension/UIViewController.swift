//
//  UIViewController.swift
//  Test_Shark
//
//  Created by Вадим  Преснов on 21.04.2021.
//

import UIKit

extension UIViewController {
    
    /// to hide the keyboard - tapping on view
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    /// add child
    func add(_ child: UIViewController) {
        child.view.tag = 1
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    /// remove child
    func remove() {
        for subview in self.view.subviews {
            if (subview.tag == 1) {
                subview.removeFromSuperview()
            }
        }
    }
}
