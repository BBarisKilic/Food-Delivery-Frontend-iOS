//
//  FoodViewController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import UIKit

class FoodViewController: UIViewController {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodExplanationLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var restaurantId: Int = 0
    var foodId: Int = 0
    var restaurantDetails: [RestaurantDetail] = []
    var currentQuantity: Int = 1
    var foodPrice: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    func setLayout() {
        addToCartButton.makeSidesRounded()
        foodNameLabel.text = restaurantDetails[restaurantId].foods[foodId].name
        foodImageView.downloaded(from: restaurantDetails[restaurantId].foods[foodId].image)
        foodExplanationLabel.text = restaurantDetails[restaurantId].foods[foodId].explanation
        foodLabel.text = restaurantDetails[restaurantId].foods[foodId].name
        foodPrice = restaurantDetails[restaurantId].foods[foodId].price
        totalPriceLabel.text = "Total Price: \(String(format: "%.2f", (foodPrice * Double(currentQuantity)))) TL"
    }
    
    @IBAction func addToCardPressed(_ sender: UIButton) {
    }
    
    @IBAction func changeQuantityPressed(_ sender: UIButton) {
        if sender.currentTitle == "-" {
            if currentQuantity > 1 {
                currentQuantity -= 1
                quantityLabel.text = "\(currentQuantity)"
                totalPriceLabel.text = "Total Price: \(String(format: "%.2f", (foodPrice * Double(currentQuantity)))) TL"
            }
        } else {
            if currentQuantity < 20 {
                currentQuantity += 1
                quantityLabel.text = "\(currentQuantity)"
                totalPriceLabel.text = "Total Price: \(String(format: "%.2f", (foodPrice * Double(currentQuantity)))) TL"
            }
        }
    }
}
