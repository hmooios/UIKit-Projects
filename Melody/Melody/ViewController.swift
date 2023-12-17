//
//  ViewController.swift
//  Melody
//
//  Created by Hmoo Myat Theingi on 16/12/2023.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        playSong()
    }
    
    func playSong(){
       let url = Bundle.main.url(forResource: "tumblrGirl", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

