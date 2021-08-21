//
//  MainViewController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var restaurantManager = RestaurantManager()
    var restaurantDetails: [RestaurantDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantManager.delegate = self
        restaurantManager.fetchData()
        
        //self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellWithReuseIdentifier: <#T##String#>)
        
        setLayout()
    }
    
    func setLayout() {
        appIconImageView.makeRounded()
        topView.addElevation()
    }
}

extension MainViewController: RestaurantManagerDelegate {
    func didUpdateRestaurant(_ restaurantManager: RestaurantManager, restaurantDetails: [RestaurantDetail]) {
        self.restaurantDetails = restaurantDetails
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}
