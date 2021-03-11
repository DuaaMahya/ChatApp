//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Dua Almahyani on 03/02/2021.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    let utility = Utilities()
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(choosingImage))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.addGestureRecognizer(gesture)
        utility.gradentColors(color1: #colorLiteral(red: 0.5920329094, green: 0.5384582877, blue: 1, alpha: 1), color2: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), view: view)
        signupButton.layer.cornerRadius = 9
    }
    
    @objc private func choosingImage() {
        
    }


}
