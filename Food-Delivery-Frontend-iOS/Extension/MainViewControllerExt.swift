//
//  MainViewController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 21.08.2021.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.restaurantDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
}
