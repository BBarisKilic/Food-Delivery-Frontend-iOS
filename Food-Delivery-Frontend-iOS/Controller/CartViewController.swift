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
    
    var cart: [Cart] = []
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        cart = SharedData.sharedInstance.cart
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CartItem", bundle: nil), forCellWithReuseIdentifier: "CartItem")
        
        setGridView()
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
}
