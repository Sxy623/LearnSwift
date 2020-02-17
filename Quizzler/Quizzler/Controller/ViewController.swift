//
//  ViewController.swift
//  Quizzler
//
//  Created by 沈心逸 on 2020/2/17.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        sender.alpha = 0.5
        
        trueButton.isUserInteractionEnabled = false
        falseButton.isUserInteractionEnabled = false
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        trueButton.alpha = 1.0
        trueButton.isUserInteractionEnabled = true
        falseButton.backgroundColor = UIColor.clear
        falseButton.alpha = 1.0
        falseButton.isUserInteractionEnabled = true
    }

}

