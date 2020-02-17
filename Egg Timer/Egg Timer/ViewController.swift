//
//  ViewController.swift
//  Egg Timer
//
//  Created by 沈心逸 on 2020/2/17.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft" : 5, "Medium" : 8, "Hard" : 12]
    var timer = Timer()
    var totalTime = 0;
    var secondsPassed = 0;
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        secondsPassed = 0
        progressBar.progress = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        secondsPassed += 1;
        progressBar.progress = Float(secondsPassed) / Float(totalTime)
        if secondsPassed == totalTime {
            titleLabel.text = "Done!"
            timer.invalidate()
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

