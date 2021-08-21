//
//  RestaurantItem.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

class RestaurantItem: UICollectionViewCell {

    
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(name: String, image: String) {
        self.restaurantLabel.text = name
        self.restaurantImage.downloaded(from: image)
    }
}
