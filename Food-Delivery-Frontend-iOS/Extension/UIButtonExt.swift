//
//  UIButton.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

extension UIButton {
    
    func makeSidesRounded() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 30
    }
}
