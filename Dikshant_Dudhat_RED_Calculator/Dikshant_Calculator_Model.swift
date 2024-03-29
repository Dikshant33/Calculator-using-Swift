//
//  Dikshant_Calculator_Model.swift
//  Dikshant_Dudhat_RED_Calculator
//
//  Created by Dikshant Dudhat on 2019-09-11.
//  Copyright © 2019 Dikshant Dudhat. All rights reserved.
//

import Foundation

class Dikshant_Calculator_Model{
    
    var firstNumber: Double?
    var secondNumber: Double?
    var operation: String?
    
    func updateNumber(newNumber: Double){
        if(firstNumber == nil){
            firstNumber = newNumber
    
        }else if(operation == nil){
            firstNumber = newNumber
        }else{
            secondNumber = newNumber
        }
    }
    
    func getResult() -> Double{
        var result: Double
        switch (operation) {
        case "+":
            result = firstNumber! + secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "x":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        default:
            result = 0.0
        }
        return result
    }
    
    func reset(){
        firstNumber = nil
        operation = nil
        secondNumber = nil
    }
}
