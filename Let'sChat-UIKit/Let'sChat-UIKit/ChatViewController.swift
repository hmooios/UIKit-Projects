//
//  ChatViewController.swift
//  Let'sChat-UIKit
//
//  Created by Hmoo Myat Theingi on 31/12/2023.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title="Let's Chat"
        navigationItem.hidesBackButton=true

    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
   

}
