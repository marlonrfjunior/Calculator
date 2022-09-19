//
//  OperatorLogic.swift
//  calculator
//
//  Created by Marlon Junior on 16/09/22.
//

import Foundation

struct OperatorLogic{
    
    private var intermeditateCalc : (number1 : Double , operation : String)?
    
    var number : Double?
    
    mutating func logicCalculate(symbol : String) -> Double?{
        if let n = self.number {
            switch symbol{
            case "%":
                return n * 0.01
            case "+/-":
                return n * -1
            case "AC":
                intermeditateCalc = nil
                number = nil
                return 0
            case "=":
                return calc(num: n, opt: intermeditateCalc!.operation)
            default:
                intermeditateCalc!.number1 = calc(num: n, opt: symbol)
                return 0
            }
        }
        return nil
    }
    
    private mutating func calc(num : Double, opt : String) -> Double{
        if let n1 = intermeditateCalc?.number1 , let opt = intermeditateCalc?.operation {
            switch opt {
            case "÷":
                intermeditateCalc!.number1 = n1 / num
                break
            case "×":
                intermeditateCalc!.number1 = n1 * num
                break
            case "-":
                intermeditateCalc!.number1 = n1 - num
                break
            case "+":
                intermeditateCalc!.number1 = n1 + num
                break
            default:
                fatalError("Symbol not recognized")
            }
            
        }else{
            intermeditateCalc = (number1: num , operation: opt)
        }
        number = nil
        return intermeditateCalc!.number1
    }
    
}
