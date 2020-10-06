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
    
    @IBOutlet weak var periodButton: RoundedButton!
    
    @IBOutlet weak var equalButton: RoundedButton!
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    //If operation has been pressed
    var performingMath = false
    var operation: Operation = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalButton.isEnabled = false
    }
    
    //Create enum for operations
    enum Operation: String {
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
    }

//Create action for back button
    @IBAction func backButtonPressed(_ sender: RoundedButton) {
        //Check if label is empty
         guard let text = computingLabel.text, !text.isEmpty
           
            else {
            //Set label to 0
            computingLabel.text = "0"
                return
            }
            //Delete last number
            computingLabel.text = String(text.dropLast())
        }
    
    //Create action for equal button
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
    
    //Create action for each symbol pressed based on sender tag
    @IBAction func operationPressed(_ sender: RoundedButton) {
        switch sender.tag {
        //addition button
        case 1:
            operationPressed(myOperation: .add)
        //subtraction button
        case 2:
            operationPressed(myOperation: .subtract)
        //multiplication button
        case 3:
            operationPressed(myOperation: .multiply)
        case 4:
        //division button
            operationPressed(myOperation: .divide)
        default:
            break
        }
    }
    
    //Create clear button action
    @IBAction func clearButtonPressed(_ sender: RoundedButton) {
        //Reset label, first number, and second number
        computingLabel.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        //disable equal button and enable period button
        equalButton.isEnabled = false
        periodButton.isEnabled = true
    }
    
    //Create action for period pressed button
    @IBAction func periodPressed(_ sender: RoundedButton) {
        //Check if period button has already been pressed
        if let text = computingLabel.text, let title = sender.currentTitle {
            //If period button has been pressed disable it
            if text.contains(title) {
                periodButton.isEnabled = false
            } else {
                //Else perform symbol pressed function and enable button
                symbolPressed(number: title)
                periodButton.isEnabled = true
            }
        }
    }
    
    //Create action for each number pressed based on sender title
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        if let title = sender.currentTitle {
        symbolPressed(number: title)
        }
    }
    
    func symbolPressed(number: String) {
     //Check if an operation has been pressed
        if performingMath == true || computingLabel.text == "0"  {
            //Empty label and set label to number entered
            computingLabel.text = ""
            computingLabel.text = number
    
            //If text entered can be converted to a double assign it to second number
            if let text = computingLabel.text , let doubleNumber = Double(text) {
                secondNumber = doubleNumber
            }
            
            performingMath = false
            
        //If operation has not been pressed set label to whatever is currently in the label plus number that has been pressed
        } else {
            if let text = computingLabel.text {
                computingLabel.text = text + number
            }
            //If number can be converted to a double assign it to second number
            if let text = computingLabel.text , let doubleNumber = Double(text) {
                secondNumber = doubleNumber
            }
        }
    }
    
    func operationPressed(myOperation: Operation) {
        //enable equal button when operation is pressed
        equalButton.isEnabled = true
        
        //Check if entered text can be converted to double
        if let label = computingLabel.text, let doubleLabel = Double(label) {
            //Set first number, operation, and label
            firstNumber = doubleLabel
            operation = myOperation
            computingLabel.text = operation.rawValue
            performingMath = true
            
        }
    }
}

