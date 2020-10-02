//
//  ViewController.swift
//  Calculator app
//
//  Created by Desiree on 5/13/20.
//  Copyright © 2020 Desiree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var computingLabel: UILabel!
    
    @IBOutlet weak var equalButton: RoundedButton!
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var performingMath = false
    var operation: Operation = .add
    var answer: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalButton.isEnabled = false
    }
    
    enum Operation: String {
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
    }


    @IBAction func backButtonPressed(_ sender: RoundedButton) {
         guard let text = computingLabel.text, !text.isEmpty
           
            else {
            computingLabel.text = "0"
                return
            }
            computingLabel.text = String(text.dropLast())
        }
    
    
  
    
    
    
    @IBAction func equalPressed(_ sender: RoundedButton) {
        
        switch operation {
        case .add:
            computingLabel.text = String(firstNumber + secondNumber)
        case .subtract:
            computingLabel.text = String(firstNumber - secondNumber)
        case .multiply:
            computingLabel.text = String(firstNumber * secondNumber)
        case .divide:
            computingLabel.text = String(firstNumber / secondNumber)
        }
        
        
    }
    
    @IBAction func additionPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: .add)
    }
    
    @IBAction func subtractionPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: .subtract)
    }
    
    
    @IBAction func multiplicationPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: .multiply)
    }
    
    @IBAction func divisionPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: .divide)
    }
    
    @IBAction func clearButtonPressed(_ sender: RoundedButton) {
        computingLabel.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        equalButton.isEnabled = false
        
    }
    
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        if let title = sender.currentTitle {
        symbolPressed(symbol: title)
        }
    }
    
    func symbolPressed(symbol: String) {
     
        if performingMath == true  {
            
            computingLabel.text = ""
            if let text = computingLabel.text {
                computingLabel.text = text + symbol
            }
            
            if let text = computingLabel.text , let doubleSecondNumber = Double(text)
            {
                
                secondNumber = doubleSecondNumber
            }
            
            performingMath = false
            
            
        } else if computingLabel.text == "0" {
            
            computingLabel.text = ""
            
            if let text = computingLabel.text {
                computingLabel.text = text + symbol
            }
            
        } else if computingLabel.text != "0" {
            
            if let text = computingLabel.text {
                computingLabel.text = text + symbol
            }
            
            if let text = computingLabel.text , let doubleSecondNumber = Double(text)
            {
                
                secondNumber = doubleSecondNumber
            }
        }

    }
    
    func operationPressed(myOperation: Operation) {
        equalButton.isEnabled = true
        
        
        if let label = computingLabel.text,
            let doubleLabel = Double(label) {
            firstNumber = doubleLabel
            operation = myOperation
            computingLabel.text = operation.rawValue
                performingMath = true
            
        }
        
       
    }
    
}

