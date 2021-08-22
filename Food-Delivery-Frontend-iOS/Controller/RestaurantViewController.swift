//
//  RestaurantDetailController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

class RestaurantViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantAddressLabel: UILabel!
    
    var restaurantId: Int = 0
    var restaurantDetails: [RestaurantDetail] = []
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "FoodItem", bundle: nil), forCellWithReuseIdentifier: "FoodItem")
       
        self.setGridView()
    }
    
    func setLayout() {
        topView.addCornerRadiusAndElevation(cornerRadius: 35)
        restaurantNameLabel.text = restaurantDetails[restaurantId].name
        restaurantImageView.downloaded(from: restaurantDetails[restaurantId].image)
        restaurantAddressLabel.text = restaurantDetails[restaurantId].location
    }
    
    func setGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("\(restaurantDetails[restaurantId].foods[indexPath.row].name) clicked")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let foodViewController = storyboard.instantiateViewController(identifier: "Food") as! FoodViewController
        
        foodViewController.restaurantId = restaurantId
        foodViewController.foodId = indexPath.row
        foodViewController.restaurantDetails = restaurantDetails
        
        present(foodViewController, animated: true, completion: nil)
    }
}
