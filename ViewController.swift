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
    
    @IBAction func decimalButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: ".")
    }
    
    
    @IBAction func oneButtonPressed(_ sender: RoundedButton) {
         symbolPressed(symbol: "1")
    }
    
    @IBAction func twoButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "2")
    }
    
    @IBAction func threeButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "3")
    }
    
    
    @IBAction func fourButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "4")
    }
    
    @IBAction func fiveButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "5")
    }
    
    @IBAction func sixButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "6")
    }
    
    @IBAction func sevenButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "7")
    }
    
    @IBAction func eightButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "8")
    }
    
    @IBAction func nineButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "9")
    }
    
    @IBAction func zeroButtonPressed(_ sender: RoundedButton) {
        symbolPressed(symbol: "0")
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
        firstNumber = Double(computingLabel.text!)!
        operation = myOperation
        computingLabel.text = operation
        performingMath = true
    }
    
}

