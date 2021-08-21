//
//  FoodItem.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import UIKit

class FoodItem: UICollectionViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addCornerRadius(cornerRadius: 6)
    }
    
    func setData(image: String, name: String, price: Double) {
        self.nameLabel.text = name
        self.foodImage.downloaded(from: image)
        self.foodImage.addCornerRadius(cornerRadius: 6)
        self.priceLabel.text = "Price: \(price) TL"
    }

}
