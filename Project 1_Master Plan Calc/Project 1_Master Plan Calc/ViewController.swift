//
//  ViewController.swift
//  Project 1_Master Plan Calc
//
//  Created by Taylor Tidwell on 9/22/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var projCost: UITextField!
    @IBOutlet weak var grossSF: UITextField!
    @IBOutlet weak var assignSF: UILabel!
    @IBOutlet weak var costPerSF: UILabel!
    
    @IBOutlet weak var asfTotal: UILabel!
    @IBOutlet weak var costPerSfTotal: UILabel!
    
    
   
    func totalCalcs(){
        var cost: Float // check amount
        var squareFeet: Float // tip percentage
        
        if projCost.text!.isEmpty{
            cost = 0.0
        } else {
            cost = Float(projCost.text!)!
        }
        if grossSF.text!.isEmpty{
            squareFeet = 0.0
        } else {
            squareFeet = Float(grossSF.text!)!
        }
        
        let asf = squareFeet * 0.7
        let costSf = cost / squareFeet
        var personTotal : Float = 0.0
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        asfTotal.text = currencyFormatter.string(from: NSNumber(value: asf))
            // returns a formatted string
        costPerSfTotal.text = currencyFormatter.string(from: NSNumber(value: costSf))
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        projCost?.delegate = self
        grossSF?.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

