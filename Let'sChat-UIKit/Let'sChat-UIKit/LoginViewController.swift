//
//  LoginViewController.swift
//  Let'sChat-UIKit
//
//  Created by Hmoo Myat Theingi on 31/12/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
      

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text,let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    self?.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }
    }
    

}
