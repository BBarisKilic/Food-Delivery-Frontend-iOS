//
//  UITextField.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

extension UITextField {
    
    func addBottomLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.darkGray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
}
