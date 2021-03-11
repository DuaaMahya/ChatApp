//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Dua Almahyani on 03/02/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let utility = Utilities()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        utility.gradentColors(color1: #colorLiteral(red: 0.5920329094, green: 0.5384582877, blue: 1, alpha: 1), color2: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), view: view)
        loginButton.layer.cornerRadius = 9
        
    }

}
