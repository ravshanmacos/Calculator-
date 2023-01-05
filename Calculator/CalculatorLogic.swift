//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ravshanbek Tursunbaev on 2023/01/05.
//

import Foundation

struct CalculatorLogic {
    
   private var number:Double?
   private var intermediateOperation:(n1:Double, operation:Int)?
    
   mutating func setNumber(_ number:Double){
        self.number = number
    }
    
  mutating  func calcMethod(_ symbol:Int?)->Double?{
        if let symbol, let number{
            if symbol == 2{
               return number * -1
            }else if symbol == 3{
               return number * 0.01
            }else if symbol == 1{
                return 0
            }else if symbol == 8{
               return calcResult()
            }else{
                self.intermediateOperation = (n1:number, operation:symbol)
            }
        }
        
      return nil
    }
    
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
