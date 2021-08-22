//
//  CartViewController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import UIKit

protocol SharedDataDelegate: AnyObject {
    func update()
}

class CartViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    
    var cart: [Cart] = []
    var totalPrice: Double = 0.0
    var totalQuantity: Int = 0
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cart = SharedData.sharedInstance.cart
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CartItem", bundle: nil), forCellWithReuseIdentifier: "CartItem")
        
        setGridView()
        
        orderButton.makeSidesRounded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        cart = SharedData.sharedInstance.cart
        totalPrice = 0.0
        totalQuantity = 0
        
        for cart in SharedData.sharedInstance.cart {
            totalPrice += (cart.price * Double(cart.quantity))
            totalQuantity += cart.quantity
        }
        
        totalPriceLabel.text = "Total Price: \(String(format: "%.2f", totalPrice)) TL"
        
        resetLayout()
    }
    
    func resetLayout() {
        self.collectionView.reloadData()
    }
    
    func setGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Do you want to continue?", message: "You're ordering \(totalQuantity) foods for \(String(format: "%.2f", totalPrice)) TL.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {_ in self.afterOrdering()}))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    func afterOrdering() {
        
        SharedData.sharedInstance.cart.removeAll()
        
        self.viewWillAppear(false)
        
        let alert = UIAlertController(title: "Information", message: "You have successfully ordered.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
