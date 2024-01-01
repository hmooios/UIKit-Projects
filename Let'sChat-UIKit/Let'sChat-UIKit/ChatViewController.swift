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
    
    var messages : [Message]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        title="Let's Chat"
        navigationItem.hidesBackButton=true
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        loadMessages()
        
    }
    
    func loadMessages(){
        db.collection("messages")
            .order(by: "date")
            .addSnapshotListener { querySnapshot, error in
            self.messages=[]
            if let e = error{
                print(e.localizedDescription)
            }else{
                if let querySnapshots = querySnapshot?.documents{
                    for doc in querySnapshots{
                        if let sender = doc["sender"], let body = doc["body"]{
                            let newMessage = Message(sender: sender as! String, body: body as! String)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async{
                                let indexPath = IndexPath(item: self.messages.count-1, section: 0)
                                self.tableView.reloadData()
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
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
                    "body":messageBody,
                    "date":Date().timeIntervalSince1970
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
           
            let message = messages[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
            
            cell.label.text = message.body
            
            if message.sender == Auth.auth().currentUser?.email{
                cell.leftPersonImage.isHidden=true
                cell.rightPersonImage.isHidden=false
                cell.messageBubble.backgroundColor=UIColor(.black)
                cell.label.textColor=UIColor(.green)
            }else{
                cell.leftPersonImage.isHidden=false
                cell.rightPersonImage.isHidden=true
                cell.messageBubble.backgroundColor=UIColor(.green)
                cell.label.textColor=UIColor(.black)
            }
            
            
            return cell
            
            
        }
        
        

}
