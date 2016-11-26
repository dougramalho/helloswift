//
//  ViewController.swift
//  Calculator
//
//  Created by Douglas Ramalho on 11/5/16.
//  Copyright © 2016 Douglas Araujo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userisInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        
        if userisInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        
        userisInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }set{
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if userisInTheMiddleOfTyping{
            brain.setOperant(operand: displayValue)
            userisInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
}

