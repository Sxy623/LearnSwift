//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 沈心逸 on 2020/3/7.
//  Copyright © 2020 Xinyi Shen. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var isSetNewNumber: Bool = false
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func setNew() {
        isSetNewNumber = true
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
            switch symbol {
            case "AC":
                intermediateCalculation = nil
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                if intermediateCalculation != nil && isSetNewNumber {
                    let result = performTwoNumCalculation(n2: n)!
                    intermediateCalculation = (n1: result, calcMethod: symbol)
                    isSetNewNumber = false
                    return result
                } else {
                    intermediateCalculation = (n1: n, calcMethod: symbol)
                    isSetNewNumber = false
                }
            }
        }
        
        return nil
    }
    
    private mutating func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            
            intermediateCalculation = nil
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        
        return number
    }
    
}
