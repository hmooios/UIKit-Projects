//
//  ViewController.swift
//  Myanmar Pagodas
//
//  Created by Hmoo Myat Theingi on 22/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var pagodas=[String]()
    var score=0
    var correctAnswer=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagodas += ["Botahtaung","Myatheindan","ShweDagon","KyiteHteeYoe","Shwezigon","Sule"]
        askQuestion()
    }
    
    func askQuestion(action:UIAlertAction! = nil){
        pagodas.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: pagodas[0]), for: .normal)
        button2.setImage(UIImage(named: pagodas[1]), for: .normal)
        button3.setImage(UIImage(named: pagodas[2]), for: .normal)
        title = "Tap to choose \(pagodas[correctAnswer].uppercased()) pagoda"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        
        if sender.tag == correctAnswer{
            score+=1
            title="Correct"
        }else{
            score-=1
            title="Wrong"
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac,animated: true)
    }
    


}

