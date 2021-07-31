//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Kamil Grzeczkowski on 30/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberArea: UILabel!
    
    var numAreaContr: NumberFieldController = NumberFieldController(fieldString: "0")
    
    
    @IBAction func digitClicked(_ sender: UIButton) {
        numAreaContr.action(action: .ADD_DIGIT, val: sender.titleLabel?.text)
        numberArea.text = numAreaContr.number
    }
    
    @IBAction func addFraction(_ sender: UIButton) {
        numAreaContr.action(action: .ADD_FRACTION, val: nil)
        numberArea.text = numAreaContr.number
        
    }
    
    @IBAction func undoClicked(_ sender: Any) {
        numAreaContr.action(action: .REMOVE_LAST_DIGIT, val: nil)
        numberArea.text = numAreaContr.number
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        numAreaContr.action(action: .CLEAR_ALL, val: nil)
        numberArea.text = numAreaContr.number
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "+":
            numAreaContr.action(action: .SUM_EXP, val: nil)
            numberArea.text = numAreaContr.number
        case "-":
            numAreaContr.action(action: .ODD_EXP, val: nil)
            numberArea.text = numAreaContr.number
        case "*":
            numAreaContr.action(action: .MUL_EXP, val: nil)
            numberArea.text = numAreaContr.number
        case "/":
            numAreaContr.action(action: .DIV_EXP, val: nil)
            numberArea.text = numAreaContr.number
        case "=":
            numAreaContr.action(action: .GET_RESULT, val: nil)
            numberArea.text = numAreaContr.number
        default:
            numberArea.text = "ERROR: Bad expression"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

