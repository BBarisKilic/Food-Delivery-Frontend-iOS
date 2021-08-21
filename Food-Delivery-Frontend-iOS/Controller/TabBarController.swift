//
//  TabBarController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearanceNavigationBar = UINavigationBar.appearance()
        appearanceNavigationBar.barTintColor = UIColor(hex: 0xFFFA4A0C)
        
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.8)
        
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Arial Hebrew", size: 20)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        let tabBarItems = tabBar.items! as [UITabBarItem]
        
        tabBarItems[0].title = "Main"
        tabBarItems[1].title = "Cart"
        tabBarItems[2].title = "More"
    }
}
