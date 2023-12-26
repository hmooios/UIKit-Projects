//
//  ViewController.swift
//  Animated Label
//
//  Created by Hmoo Myat Theingi on 26/12/2023.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet var animatedTitle: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedTitle.text="CLTypingLabel from cocoapods"
        // Do any additional setup after loading the view.
    }


}

