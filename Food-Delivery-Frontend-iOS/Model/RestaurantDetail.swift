//
//  RestaurantDetail.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import Foundation

struct RestaurantDetail: Decodable {
    let name: String
    let image: String
    let location: String
}
