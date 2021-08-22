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
        topView.addCornerRadiusAndElevation(cornerRadius: 20)
        
        //LoginButton
        loginButton.makeSidesRounded()
        
        //Email TextField
        emailTextField.addBottomLine()
        
        //Password TextField
        passwordTextField.addBottomLine()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        
        nextViewController.modalPresentationStyle = .fullScreen
        
        self.present(nextViewController, animated:true, completion:nil)
    }
}

