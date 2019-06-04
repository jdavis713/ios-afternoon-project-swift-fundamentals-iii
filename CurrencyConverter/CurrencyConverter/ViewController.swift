//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jordan Davis on 6/3/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    enum CurrencyType: Double {
        case cad = 1.34
        case peso = 19.77
    }
    
    //MARK: - Functions
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        if unit == CurrencyType.cad {
            conversionResult = dollars * cadConversion
        } else if unit == CurrencyType.peso {
            conversionResult = dollars * pesoConversion
        }
        return conversionResult
    }
        
    
    //MARK: - Actions
    
    @IBAction func convert(_ sender: Any) {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        guard let userInput = fromCurrencyTextField.text,
        let userInputDouble = Double(userInput)
        else { return }
        
        if toCurrencyLabel.text == "Currency (CAD)" {
            
            let number: NSNumber = NSNumber(value: convert(dollars: userInputDouble, to: .cad))
            let formattedNumber = currencyFormatter.string(from: number)
            if let unWrappedNumber = formattedNumber {
                toCurrencyTextField.text = unWrappedNumber
            }
            
        } else if toCurrencyLabel.text == "Currency (Peso)" {
            
            let number: NSNumber = NSNumber(value: convert(dollars: userInputDouble, to: .peso))
            let formattedNumber = currencyFormatter.string(from: number)
            if let unwrappedNumber = formattedNumber {
                toCurrencyTextField.text = unwrappedNumber
            }
            
        }
    }
    
    @IBAction func cadConvert(_ sender: Any) {
        currencyType = CurrencyType.cad
        toCurrencyLabel?.text = "Currency (CAD)"
        toCurrencyTextField.text = "$"
    }
    
    @IBAction func pesoConvert(_ sender: Any) {
        currencyType = CurrencyType.peso
        toCurrencyLabel?.text = "Currency (Peso)"
        toCurrencyTextField.text = "$"
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    var currencyType = CurrencyType.cad
    let cadConversion: Double = 1.34
    let pesoConversion: Double = 19.77
    var conversionResult: Double = 0.0
}


//if cadButton.isSelected == true,
//    let dollarString = fromCurrencyTextField.text,
//    let dollars = Double(dollarString) {
//    let canConversion = convert(dollars: dollars, to: .cad)
//} else if pesoButton.isSelected == true,
//    let dollarString = fromCurrencyTextField.text,
//    let dollars = Double(dollarString) {
//    let pesoConversion = convert(dollars: dollars, to: .peso)
//}


//guard let dollarString = fromCurrencyTextField.text,
//    let dollars = Double(dollarString) else {
//        return 0.0
//}
//
//switch unit {
//case .peso:
//    _ = dollars * CurrencyType.peso.rawValue
//case .cad:
//    _ = dollars * CurrencyType.cad.rawValue
//}
//
//return 0.0
