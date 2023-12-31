//
//  RegisterViewController.swift
//  Let'sChat-UIKit
//
//  Created by Hmoo Myat Theingi on 30/12/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
      
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email=emailTextField.text,let password=passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
        
    }
    
}
