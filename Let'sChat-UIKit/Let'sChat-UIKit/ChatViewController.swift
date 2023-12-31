//
//  ChatViewController.swift
//  Let'sChat-UIKit
//
//  Created by Hmoo Myat Theingi on 31/12/2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages : [Message]=[
        Message(sender: "user1@gmail.com", body: "Hello!"),
        Message(sender: "user2@gmail.com", body: "Hey!"),
        Message(sender: "user1@gmail.com", body: "How are you?"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        title="Let's Chat"
        navigationItem.hidesBackButton=true
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
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
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email{
            // Add a new document with a generated ID
            do {
                db.collection("messages").addDocument(data: [
                    "sender":messageSender,
                    "body":messageBody
                ]) { error in
                    if let e = error{
                        print("Error adding document: \(e.localizedDescription)")
                    }else{
                        print("Saved data successfully. ")
                    }
                }
                
                
            }
            
            
        }
        
        
    }
}
    
    extension ChatViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
            cell.label.text = messages[indexPath.row].body
            return cell
        }
        
        

}
