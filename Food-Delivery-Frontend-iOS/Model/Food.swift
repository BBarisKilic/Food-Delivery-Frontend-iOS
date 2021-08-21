//
//  Food.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import Foundation

struct Food: Decodable {
    let name: String
    let explanation: String
    let image: String
    let price: Double
}
