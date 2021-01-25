//
//  CalculatorManager.swift
//  Calculator app
//
//  Created by Desiree on 1/25/21.
//  Copyright © 2021 Desiree. All rights reserved.
//

import UIKit

struct CalculatorManager {
    var operation = Operation.add
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    //If operation has been pressed
    var performingMath = false
    
    func calculate() -> String {
        switch operation {
        case .add:
            return String(firstNumber + secondNumber)
        case .subtract:
            return String(firstNumber - secondNumber)
        case .multiply:
            return String(firstNumber * secondNumber)
        case .divide:
            return String(firstNumber / secondNumber)
        }
    }
    
    
    mutating func showOperation(for buttonTag: Int, label: UILabel) {
        if let text = label.text, let doubleText = Double(text) {
            firstNumber = doubleText
            
            switch buttonTag {
            //addition button
            case 1:
                operation = .add
            //subtraction button
            case 2:
                operation = .subtract
            //multiplication button
            case 3:
                operation = .multiply
            case 4:
            //division button
                operation = .divide
            default:
                break
            }
            
            label.text = operation.rawValue
            performingMath = true
        }
       
    }
    
    mutating func symbolPressed(number: String, label: UILabel) {
     //Check if an operation has been pressed
        if performingMath == true || label.text == "0"  {
            //Empty label and set label to number entered
            label.text = ""
            label.text = number
    
            //If text entered can be converted to a double assign it to second number
            if let text = label.text , let doubleNumber = Double(text) {
                secondNumber = doubleNumber
            }
            
            performingMath = false
            
        //If operation has not been pressed set label to whatever is currently in the label plus number that has been pressed
        } else {
            if let text = label.text {
                label.text = text + number
            }
            //If number can be converted to a double assign it to second number
            if let text = label.text , let doubleNumber = Double(text) {
                secondNumber = doubleNumber
            }
        }
    }
}
