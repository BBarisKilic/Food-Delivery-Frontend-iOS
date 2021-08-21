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
    
    var restaurant = RestaurantManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurant.fetchData()
        setLayout()
    }
    
    func setLayout() {
        appIconImageView.makeRounded()
        topView.addElevation()
    }
}
