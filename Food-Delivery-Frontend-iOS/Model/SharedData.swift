//
//  SharedData.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import Foundation

class SharedData {
    static let sharedInstance = SharedData()
    var cart: [Cart] = []
    
    private init() {}
}
