//
//  ViewController.swift
//  Dikshant_Dudhat_RED_Calculator
//
//  Created by Dikshant Dudhat on 2019-09-11.
//  Copyright © 2019 Dikshant Dudhat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Mark: Outlets
    
    @IBOutlet weak var numberDisplay: UITextField!
    var startNewNumber = true
    
    //MARK:- other variables
    var calculatorModel = Dikshant_Calculator_Model()
    
    
    
    
    // MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    //MARK: IBActions
    @IBAction func buttonTouched(_ sender: UIButton) {
        print("button Touched")
        print(sender.currentTitle!)
        
        let buttonText = sender.currentTitle!
        
        var currentValue = numberDisplay.text!
        
        switch(buttonText){
        case  "0","1","2","3","4","5","6","7","8","9",".":
        print(buttonText)
        if(startNewNumber) {
            if(buttonText == "."){
                currentValue = "0."
            } else {
                currentValue = buttonText
            }
        } else {
              if(buttonText == "."){
                 if(currentValue.contains(".")){
                    // do nothing
                } else {
              currentValue = currentValue + buttonText
                }
              } else {
                currentValue = currentValue + buttonText
            }
            
        }
            startNewNumber = false
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
        case "+", "-", "x", "/" :
            
            if(calculatorModel.secondNumber != nil){
                
                currentValue = String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
                
            }
                   calculatorModel.operation = buttonText
                   startNewNumber = true
         // accept second number after
            
        case "C":
                    currentValue = "0"
                    calculatorModel.reset()
                    startNewNumber = true
        
        case "=" :
            // get result and display
            if(calculatorModel.secondNumber == nil){
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
           
            }
            currentValue = String(calculatorModel.getResult())
            startNewNumber = true
            
        default:
        print(buttonText)
        }
        numberDisplay.text = currentValue
    }
    
}

