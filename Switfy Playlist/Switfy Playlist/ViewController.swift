//
//  ViewController.swift
//  Swifty Playlist
//
//  Created by Hmoo Myat Theingi on 17/12/2023.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    var player:AVAudioPlayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func songPressed(_ sender: UIButton) {
        playSong(songName: sender.currentTitle!)
    }
        
    func playSong(songName:String){
           let url = Bundle.main.url(forResource: songName, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    


