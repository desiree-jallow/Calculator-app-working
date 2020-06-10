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
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var performingMath = false
    var operation = ""
    var answer: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func backButtonPressed(_ sender: RoundedButton) {
         guard
                let text = computingLabel.text,
                !text.isEmpty
            //text != "0"
            else {
                return
            }
            computingLabel.text = String(text.dropLast())
        }
    
    
    @IBAction func additionPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: "+")
       
    }
    
    @IBAction func subtractionPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: "-")
    }
    
    @IBAction func multiplicationPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: "*")
    }
    
    
    @IBAction func divisionPressed(_ sender: RoundedButton) {
        operationPressed(myOperation: "/")
    }
    
    
    @IBAction func equalPressed(_ sender: RoundedButton) {
        if operation == "+" {
            computingLabel.text = String(firstNumber + secondNumber)
        } else if operation == "-" {
            computingLabel.text = String(firstNumber - secondNumber)
        } else if operation == "/" {
            computingLabel.text = String(firstNumber / secondNumber)
        } else if operation == "*" {
            computingLabel.text = String(firstNumber * secondNumber)
        }
        
    }
    
    @IBAction func clearButtonPressed(_ sender: RoundedButton) {
        computingLabel.text = "0"
    }
    
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        if let title = sender.currentTitle {
        symbolPressed(symbol: title)
        }
    }
    
    
    
    func symbolPressed(symbol: String) {
     
        if performingMath == true {
            computingLabel.text = ""
            computingLabel.text = computingLabel.text! + symbol
            secondNumber = Double(computingLabel.text!)!
            performingMath = false
        } else if computingLabel.text == "0" {
            computingLabel.text = ""
            computingLabel.text = computingLabel.text! + symbol
        } else if computingLabel.text != "0" {
            computingLabel.text = computingLabel.text! + symbol
            secondNumber = Double(computingLabel.text!)!
        }

    }
    
    func operationPressed(myOperation: String) {
       
        if let label = computingLabel.text,
            let doubleLabel = Double(label) {
                firstNumber = doubleLabel
                operation = myOperation
                computingLabel.text = operation
                performingMath = true
        }
        
       
    }
    
}

