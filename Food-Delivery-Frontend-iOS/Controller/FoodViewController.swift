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
    var foodName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    func setLayout() {
        addToCartButton.makeSidesRounded()
        foodName = restaurantDetails[restaurantId].foods[foodId].name
        foodNameLabel.text = foodName
        foodLabel.text = foodName
        foodImageView.downloaded(from: restaurantDetails[restaurantId].foods[foodId].image)
        foodExplanationLabel.text = restaurantDetails[restaurantId].foods[foodId].explanation
        foodPrice = restaurantDetails[restaurantId].foods[foodId].price
        totalPriceLabel.text = "Total Price: \(String(format: "%.2f", (foodPrice * Double(currentQuantity)))) TL"
    }
    
    @IBAction func addToCardPressed(_ sender: UIButton) {
        SharedData.sharedInstance.cart.append(Cart(foodName: foodName, quantity: currentQuantity, price: foodPrice))
        
        let alert = UIAlertController(title: "Information", message: "Your order have been successfully added to cart.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.afterAddingToCart()}))
        
        self.present(alert, animated: true)
        
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
    
    func afterAddingToCart() {
        dismiss(animated: true, completion: nil)
    }
}
