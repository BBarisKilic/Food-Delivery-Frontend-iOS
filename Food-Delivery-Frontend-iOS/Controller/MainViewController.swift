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
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantManager.delegate = self
        restaurantManager.fetchData()
        
        self.setLayout()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "RestaurantItem", bundle: nil), forCellWithReuseIdentifier: "RestaurantItem")
        
        self.setGridView()
    }
    
    func setLayout() {
        appIconImageView.makeRounded()
        topView.addElevation(cornerRadius: 35)
    }
    
    func resetLayout() {
        self.collectionView.reloadData()
    }
    
    func setGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath) {
        print("\(restaurantDetails[indexPath.row].name) clicked")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Restaurant") as! RestaurantViewController
        
        nextViewController.restaurantId = indexPath.row
        nextViewController.restaurantDetails = restaurantDetails
        
        navigationController?.pushViewController(nextViewController, animated: true)
      }
}
