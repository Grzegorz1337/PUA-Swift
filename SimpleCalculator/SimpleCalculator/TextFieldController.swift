//
//  TextFieldController.swift
//  SimpleCalculator
//
//  Created by Kamil Grzeczkowski on 31/07/2021.
//

import Foundation

enum Actions {
    case ADD_DIGIT
    case ADD_FRACTION
    case SUM_EXP
    case ODD_EXP
    case MUL_EXP
    case DIV_EXP
    case CLEAR_ALL
    case REMOVE_LAST_DIGIT
    case GET_RESULT
    case NONE
}

enum EquationProcessing {
    case NUMBER_INPUT
    case TASK
    case RESULT
}

class NumberFieldController: ObservableObject {
    var number: String
    var hasFraction: Bool
    var task:Actions
    var processing:EquationProcessing
    var numA: Double?
    var numB: Double?
    
    init(fieldString:String) {
        number = fieldString
        hasFraction = false
        processing = .NUMBER_INPUT
        task = .NONE
        numA = nil
        numB = nil
    }
    
    private func processExp(a:Double, b:Double, exp:Actions) -> Double{
        switch exp {
        case .SUM_EXP:
            return (a + b)
        case .ODD_EXP:
            return a - b
        case .MUL_EXP:
            return a * b
        case .DIV_EXP:
            if b != 0{
                return a / b
            }
            else{
                number = "Dividing by 0 ?!"
            }
        default:
            number = "Wrong expression"
        }
        return 0.0
    }
    
    func action(action:Actions, val:String?){
        switch action {
        case .ADD_DIGIT:
            switch processing {
            case .NUMBER_INPUT:
                if number == "0"{
                    number = val ?? "0"
                }
                else{
                    number.append(val ?? "")
                }
            case .TASK:
                if numA == nil{
                    numA = Double(number) ?? 999999
                    number = val ?? "0"
                    processing = .NUMBER_INPUT
                }
            default:
                number = "action processing error"
            }
        case .ADD_FRACTION:
            if !hasFraction{
                number.append(".")
            }
            hasFraction = true
        case .CLEAR_ALL:
            number = "0"
            hasFraction = false
            numA = nil
            numB = nil
            task = .NONE
            processing = .NUMBER_INPUT
        case .REMOVE_LAST_DIGIT:
            if number.last == "."{
                hasFraction = false
            }
            number = String(number.dropLast())
            if number.count == 0{
                number = "0"
            }
        case .SUM_EXP:
            processing = .TASK
            task = .SUM_EXP
            if numA != nil{
                numB = Double(number) ?? 999999
                numA = processExp(a: numA!, b: numB!, exp: .SUM_EXP)
                number = String(format: "%2f", numA!)
                numA = nil
                hasFraction = false
            }
        case .ODD_EXP:
            processing = .TASK
            task = .ODD_EXP
            if numA != nil{
                numB = Double(number) ?? 999999
                numA = processExp(a: numA!, b: numB!, exp: .ODD_EXP)
                number = String(format: "%2f", numA!)
                numA = nil
                hasFraction = false
            }
        case .MUL_EXP:
            processing = .TASK
            task = .MUL_EXP
            if numA != nil{
                numB = Double(number) ?? 999999
                numA = processExp(a: numA!, b: numB!, exp: .MUL_EXP)
                number = String(format: "%2f", numA!)
                numA = nil
                hasFraction = false
            }
        case .DIV_EXP:
            processing = .TASK
            task = .DIV_EXP
            if numA != nil{
                numB = Double(number) ?? 999999
                numA = processExp(a: numA!, b: numB!, exp: .DIV_EXP)
                number = String(format: "%2f", numA!)
                numA = nil
                hasFraction = false
            }
        case .GET_RESULT:
            processing = .RESULT
            if numA != nil{
                numB = Double(number) ?? 999999
                numA = processExp(a: numA!, b: numB!, exp: task)
                number = String(format: "%2f", numA!)
                numA = nil
                hasFraction = false
            }
        default:
            number = "Unknown_action"
        }
    }
}
