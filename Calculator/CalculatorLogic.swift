//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ravshanbek Tursunbaev on 2023/01/05.
//

import Foundation

struct CalculatorLogic {
    
   private var number:Double?
    //variable to hold first entered number and operation
   private var intermediateOperation:(n1:Double, operation:Int)?
    
    //method to set number variable
   mutating func setNumber(_ number:Double){
        self.number = number
    }
    
//calculate the result according to the passed sybmol
  mutating  func calcMethod(_ symbol:Int?)->Double?{
      //if symbol and number exists
        if let symbol, let number{
            
            if symbol == 2{       // symbol 2 is a negative or position number maker
               return number * -1
            }else if symbol == 3{ // symbol 3 is a changer to percentage
               return number * 0.01
            }else if symbol == 1{ // symbol 1 is reset button
                return 0
            }else if symbol == 8{ //symbol 8 is a equal button
               return calcResult()
            }else{
                self.intermediateOperation = (n1:number, operation:symbol)
            }
        }
        
      return nil
    }
    
    // if equal button pressed, calulate final result method
    private func calcResult()->Double?{
        if let n1 = intermediateOperation?.n1, let operation = intermediateOperation?.operation, let n2 = number{
            switch operation{
            case 7:
                return n1 + n2
            case 5:
                return n1*n2
            case 4:
                return n1 / n2
            case 6:
                return n1 - n2
            default:
                fatalError("operation is not possible")
            }
        }
        
        return nil
    }
    
}
