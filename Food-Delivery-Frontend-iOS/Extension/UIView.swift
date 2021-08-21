//
//  UIView.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

extension UIView {
    
    func addElevation() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 35
        self.layer.shadowPath =
              UIBezierPath(roundedRect: self.bounds,
              cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
    }
}
