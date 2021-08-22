//
//  CartItem.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import UIKit

class CartItem: UICollectionViewCell {
    
    @IBOutlet weak var quantityNumberLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addCornerRadius(cornerRadius: 6)
    }
    
    func setData(cart: Cart) {
        foodNameLabel.text = cart.foodName
        quantityNumberLabel.text = "\(cart.quantity)x"
    }

    @IBAction func deletePressed(_ sender: Any) {
    }
}
