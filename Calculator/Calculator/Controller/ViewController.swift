//
//  ViewController.swift
//  Calculator
//
//  Created by 沈心逸 on 2020/2/16.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            if newValue == 0 {
                displayLabel.text = "0"
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                
                if numValue == "0" {
                    displayValue = 0
                    return
                }
                
                if numValue == "." {
                    displayValue = 0
                    displayLabel.text = displayLabel.text! + numValue
                } else {
                    displayLabel.text = numValue
                }
                
                isFinishedTypingNumber = false
                calculator.setNew()
            } else {
                
                if numValue == "." && displayLabel.text!.contains(".") { return }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

