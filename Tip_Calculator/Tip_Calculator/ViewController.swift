//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Taylor Tidwell on 9/23/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBOutlet weak var tipTotal: UILabel!
    @IBOutlet weak var moneyTotal: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    @IBAction func updatePeople(_ sender: UIStepper) {
        if peopleStepper.value == 1{
            peopleLabel.text = "1 Person"
        } else{
            peopleLabel.text = String(format: "%.0f", peopleStepper.value) + " People"
        }
//        updateTipTotals()
    }
    
    func updateTipTotals(){
        var amount: Float // check amount
        var percent: Float // tip percentage
        
        if checkAmount.text!.isEmpty{
            amount = 0.0
        } else {
            amount = Float(checkAmount.text!)!
        }
        if tipPercent.text!.isEmpty{
            percent = 0.0
        } else {
            percent = Float(tipPercent.text!)!/100
        }
        
        let numberOfPeople = peopleStepper.value
        let tip = amount * percent
        let total = amount + tip
        var personTotal : Float = 0.0
        
        if numberOfPeople > 0 {
            personTotal = total / Float(numberOfPeople)
        } else {
        //create a UIAlertController object
        let alert=UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertController.Style.alert)
        //create a UIAlertAction object for the button
        let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancelAction) //adds the alert action to the alert object
        let okAction=UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
           self.peopleStepper.value = 1
            self.peopleLabel.text? = "1 person"
            self.updateTipTotals()
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        }
        
        //format results as currency
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
            // set the number style
        tipTotal.text = currencyFormatter.string(from: NSNumber(value: tip))
            // returns a formatted string
        moneyTotal.text = currencyFormatter.string(from: NSNumber(value: total))
        totalPerPerson.text = currencyFormatter.string(from: NSNumber(value: personTotal))
        totalPerPerson.textColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func calcButton(_ sender: UIButton) {
        updateTipTotals()
    }
    
    
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)); view.addGestureRecognizer(tap)
        
        checkAmount.delegate = self
        tipPercent.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
    }
    
    
    
    @objc func keyboardWillHide(notification: NSNotification) { if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
}


