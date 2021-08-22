//
//  UserViewController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 22.08.2021.
//

import UIKit

class UserViewController: UIViewController {
    
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setLayout()
    }
    
    func setLayout() {
        personImageView.image = #imageLiteral(resourceName: "BBKIcon")
        personImageView.addCornerRadius(cornerRadius: 60)
        
        nameLabel.text = "Bulent Baris"
        lastNameLabel.text = "Kilic"
        emailLabel.text = "baris@email.com"
        addressLabel.text = "Cologne, Germany"
        
        nameLabel.textColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        lastNameLabel.textColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        emailLabel.textColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        addressLabel.textColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
    }
}
