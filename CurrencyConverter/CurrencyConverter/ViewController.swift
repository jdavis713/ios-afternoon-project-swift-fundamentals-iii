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
        guard let dollarString = fromCurrencyTextField.text,
            let dollars = Double(dollarString) else {
            return 0.0
        }
        
        switch unit {
        case .peso:
            _ = dollars * currencyTypes.peso.rawValue
        case .cad:
            _ = dollars * currencyTypes.cad.rawValue
        }
        
        return 0.0
    }
        
    
    //MARK: - Actions
    
    @IBAction func convert(_ sender: Any) {
        if cadButton.isSelected == true,
           let dollarString = fromCurrencyTextField.text,
            let dollars = Double(dollarString) {
            let canConversion = convert(dollars: dollars, to: .cad)
        } else if pesoButton.isSelected == true,
            let dollarString = fromCurrencyTextField.text,
            let dollars = Double(dollarString) {
            let pesoConversion = convert(dollars: dollars, to: .peso)
        }
    }
    
    @IBAction func cadConvert(_ sender: Any) {
        toCurrencyLabel?.text = "Currency (CAD)"
    }
    
    @IBAction func pesoConvert(_ sender: Any) {
        toCurrencyLabel?.text = "Currency (Peso)"
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    var currencyTypes = CurrencyType.self
}

