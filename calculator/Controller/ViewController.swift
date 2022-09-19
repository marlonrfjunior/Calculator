//
//  ViewController.swift
//  calculator
//
//  Created by Marlon Junior on 09/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UILabel!
    
    var displayValue : Double {
        get{
            return Double(textField.text!) ?? 0
        }
        set{
                 if floor(newValue) == newValue {
                         textField.text = String(Int(newValue))
                }
                else{
                        textField.text = String(newValue)
                }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var calculator = OperatorLogic()
    @IBAction func numberPressed(_ sender: UIButton) {

        if let textLabel = textField.text , let buttonLabel = sender.titleLabel?.text {

            if buttonLabel != "." {
                displayValue = Double(textLabel + buttonLabel)!
                calculator.number = displayValue
            }
            else {
                if !(textLabel.contains(".")){
                    textField.text = textLabel + "."
                }
            }
        }
    }
    
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        displayValue = calculator.logicCalculate(symbol: sender.titleLabel?.text ?? "")!
    }
    
}

