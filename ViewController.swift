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
    
    var calculatorManager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalButton.isEnabled = false
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
        computingLabel.text = calculatorManager.calculate()
       
    }
    
    //Create action for each symbol pressed based on sender tag
    @IBAction func operationPressed(_ sender: RoundedButton) {
        //enable equal button when operation is pressed
        equalButton.isEnabled = true
        calculatorManager.showOperation(for: sender.tag, label: computingLabel)
        
    }
    
    //Create clear button action
    @IBAction func clearButtonPressed(_ sender: RoundedButton) {
        //Reset label, first number, and second number
        computingLabel.text = "0"
        calculatorManager.firstNumber = 0.0
        calculatorManager.secondNumber = 0.0
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
                calculatorManager.symbolPressed(number: title, label: computingLabel)
                periodButton.isEnabled = true
            }
        }
    }
    
    //Create action for each number pressed based on sender title
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        if let title = sender.currentTitle {
            calculatorManager.symbolPressed(number: title, label: computingLabel)
        }
    }
}
    
    
   


