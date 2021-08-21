//
//  ViewController.swift
//  Food-Delivery-Frontend-iOS
//
//  Created by Bülent Barış Kılıç on 19.08.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        //TopView
        self.topView.layer.masksToBounds = true
        self.topView.layer.cornerRadius = 35
        self.topView.layer.shadowPath =
              UIBezierPath(roundedRect: self.topView.bounds,
              cornerRadius: self.topView.layer.cornerRadius).cgPath
        self.topView.layer.shadowColor = UIColor.black.cgColor
        self.topView.layer.shadowOpacity = 0.5
        self.topView.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.topView.layer.shadowRadius = 1
        self.topView.layer.masksToBounds = false
        
        //LoginButton
        self.loginButton.layer.masksToBounds = true
        self.loginButton.layer.cornerRadius = 30
        
        //Email TextField
        let emailBottomLine = CALayer()
        emailBottomLine.frame = CGRect(x: 0, y: emailTextField.frame.height - 2, width: emailTextField.frame.width, height: 2)
        emailBottomLine.backgroundColor = UIColor.darkGray.cgColor
        self.emailTextField.borderStyle = .none
        self.emailTextField.layer.addSublayer(emailBottomLine)
        
        //Password TextField
        let passwordBottomLine = CALayer()
        passwordBottomLine.frame = CGRect(x: 0, y: passwordTextField.frame.height - 2, width: passwordTextField.frame.width, height: 2)
        passwordBottomLine.backgroundColor = UIColor.darkGray.cgColor
        self.passwordTextField.borderStyle = .none
        self.passwordTextField.layer.addSublayer(passwordBottomLine)
    }

    
}

