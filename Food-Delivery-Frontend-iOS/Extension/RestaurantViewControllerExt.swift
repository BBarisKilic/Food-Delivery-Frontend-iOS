//
//  RestaurantDetailControllerExt.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import UIKit

extension RestaurantViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.restaurantDetails[restaurantId].foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItem", for: indexPath) as! FoodItem
        cell.setData(image: self.restaurantDetails[restaurantId].foods[indexPath.row].image, name: self.restaurantDetails[restaurantId].foods[indexPath.row].name,  price: self.restaurantDetails[restaurantId].foods[indexPath.row].price)
        
        return cell
    }
}

extension RestaurantViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        
        return CGSize(width: width, height: 80)
    }
    
    func calculateWith() -> CGFloat {
        let estimateWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}
