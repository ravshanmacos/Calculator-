//
//  ViewController.swift
//  Calculator
//
//  Created by Ravshanbek Tursunbaev on 2023/01/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
   private var isFinishedTypingNumber: Bool = true
   var calculatorLogic = CalculatorLogic()
   private var displayValue:Double{
        get{
            guard let numValue = Double(resultLabel.text!) else{
                fatalError("Cannot convert a display label text to a double")
            }
            return numValue
        }
        set{
            resultLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcBtnTapped(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true

        calculatorLogic.setNumber(displayValue)
        if let result = calculatorLogic.calcMethod(sender.tag){
            displayValue = result
        }
        
    }
    
    @IBAction func numBtnTapped(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
      //  calculatorLogic.dealtWithDot(sender.currentTitle)
        
        if let title = sender.titleLabel?.text{
               if isFinishedTypingNumber{
                   resultLabel.text = title
                   isFinishedTypingNumber = false
               }else{
                   if title == "."{
                       let isInt = floor(displayValue) == displayValue
                       if !isInt{return}
                   }
                   resultLabel.text = resultLabel.text! + title
               }
           }
    }
}

