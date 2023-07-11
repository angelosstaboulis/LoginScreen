//
//  ViewController.swift
//  LoginScreen
//
//  Created by Angelos Staboulis on 11/7/23.
//

import UIKit
import EmailValidator
import Navajo_Swift
class ViewController: UIViewController {
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        validateEmail()
        vaidatePassword()
        
    }
    func validateEmail(){
        let validate =  EmailValidator.validate(email: txtEmail.text!)
        if validate {
            txtEmail.layer.borderColor = UIColor.green.cgColor
            txtEmail.layer.borderWidth = 1
        }else{
            txtEmail.layer.borderColor = UIColor.red.cgColor
            txtEmail.layer.borderWidth = 1
        }
    }
    func vaidatePassword(){
        let lengthRule = LengthRule(min: 6, max: 8)
        let charactersRule = RequiredCharacterRule(preset: .lowercaseCharacter)
        let passwordrules = PasswordValidator(rules: [lengthRule,charactersRule])
        let validateRules = passwordrules.validate(txtPassword.text!)
        if validateRules != nil {
            txtPassword.layer.borderColor = UIColor.red.cgColor
            txtPassword.layer.borderWidth = 1
            
        } else {
            txtPassword.layer.borderColor = UIColor.green.cgColor
            txtPassword.layer.borderWidth = 1
            
        }
    }
    
}

