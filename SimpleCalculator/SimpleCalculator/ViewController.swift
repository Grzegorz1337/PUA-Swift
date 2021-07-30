//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Kamil Grzeczkowski on 30/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var hasDot:Bool
    @IBOutlet weak var numberArea: UILabel!
    @IBAction func digitClicked(_ sender: UIButton){
        if numberArea.text == "0"{
            numberArea.text = sender.titleLabel?.text ?? "0"
        }
        else{
            numberArea.text?.append(sender.titleLabel?.text ?? "0")
        }
    }
    @IBAction func addDot(_ sender: Any) {
        if !hasDot {
            numberArea.text?.append(".")
            hasDot = true
        }
    }
    @IBAction func clearNumberArea(_ sender: UIButton){
        numberArea.text = "0"
        hasDot = false
    }
    
    @IBAction func removeLastElement(_ sender: Any) {
        if numberArea.text?.last == "." {
            self.hasDot = false
        }
        numberArea.text?.remove(at: (numberArea.text?.index(before: numberArea.text!.endIndex))!)
        if numberArea.text?.count == 0{
            numberArea.text?.append("0")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hasDot = false
        // Do any additional setup after loading the view.
    }
}

