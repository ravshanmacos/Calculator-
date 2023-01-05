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
    
    //value which is displayed on result screen
   private var displayValue:Double{
        get{
            //return result of conversion resultLabel's text to double
            guard let numValue = Double(resultLabel.text!) else{
                fatalError("Cannot convert a display label text to a double")
            }
            return numValue
        }
        set{
            //update resultLabel with new value of display value
            resultLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //What should happen when a non-number button is pressed
    @IBAction func calcBtnTapped(_ sender: UIButton) {
        //update isFinishedTypingNumber variable
        isFinishedTypingNumber = true
       //update the number property of calculatorLogic class
        calculatorLogic.setNumber(displayValue)
        // pass the button's tag to calcMethod of calculator logic class
        // and update display value with new result
        if let result = calculatorLogic.calcMethod(sender.tag){
            displayValue = result
        }
        
    }
    
    //action handler when one of numbers pressed
    @IBAction func numBtnTapped(_ sender: UIButton) {
        //get the title if button's title exist
        if let title = sender.titleLabel?.text{
            
               if isFinishedTypingNumber{
                   //if user entered number before current number
                   //update result label text and variable
                   resultLabel.text = title
                   isFinishedTypingNumber = false
               }else{
                   //if user tapped dot symbol
                   if title == "."{
                       //checking if user tapped dot symbol before
                       let isInt = floor(displayValue) == displayValue
                       // if user tapped dot symbol before, do nothing return
                       if !isInt{return}
                   }
                   //if not, update result label with dot symbol
                   resultLabel.text = resultLabel.text! + title
               }
           }
    }
}

