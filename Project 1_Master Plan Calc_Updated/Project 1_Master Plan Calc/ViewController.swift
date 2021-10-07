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
    @IBOutlet weak var avConstructionCost: UILabel!
    
    @IBOutlet weak var asfTotal: UILabel!
    @IBOutlet weak var costPerSfTotal: UILabel!
    
    @IBOutlet weak var projType: UISegmentedControl!
    @IBOutlet weak var fundingType: UISegmentedControl!
    
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var fundingImage: UIImageView!
    
    var costSf:Float = 0.0
    
    func totalCalcs(){
        var cost: Float // check amount
        var squareFeet: Float // tip percentage
        
        if projCost.text!.isEmpty {
            cost = 0.0
        } else {
            cost = Float(projCost.text!) ?? 0.0
        }
        if grossSF.text!.isEmpty{
            squareFeet = 0.0
        } else {
            squareFeet = Float(grossSF.text!)!
        }
        
        let asf = squareFeet * 0.7
        
        if fundingType.selectedSegmentIndex == 0{
            costSf = cost / squareFeet
        } else if fundingType.selectedSegmentIndex == 1 {
            costSf = (cost / squareFeet) * 0.85
        } else if fundingType.selectedSegmentIndex == 2 {
            costSf = (cost / squareFeet) * 0.9
        }
        
        
        if costSf.isNaN {
            costSf = 0.0
        }
        
        if projCost.text!.isEmpty || grossSF.text!.isEmpty {
            //create a UIAlertController object
            let alert=UIAlertController(title: "Warning", message: "The Project Cost or Gross Square Footage fields have been left empty", preferredStyle: UIAlertController.Style.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            let okAction=UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
        })
            
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        }
        
        let currencyFormatter = NumberFormatter()
        let numericFormatter = NumberFormatter()
        
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        numericFormatter.numberStyle = NumberFormatter.Style.decimal
        asfTotal.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        asfTotal.font = UIFont.boldSystemFont(ofSize: 24)
        asfTotal.text = numericFormatter.string(for: NSNumber(value: asf))! + " SF of Usable Space"
            // returns a formatted string
        costPerSfTotal.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        costPerSfTotal.font = UIFont.boldSystemFont(ofSize: 24)
        costPerSfTotal.text = currencyFormatter.string(from: NSNumber(value: costSf))
        
        updateFunding()
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        avConstructionCost.text = ""
        costPerSfTotal.text = ""
        asfTotal.text = ""
        grossSF.text = ""
        projCost.text = ""
        typeImage.image = UIImage(named: "x")
        fundingImage.image = UIImage(named: "x")
        projType.selectedSegmentIndex = 0
        fundingType.selectedSegmentIndex = 0
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        totalCalcs()
    }
    
    var typeOfProj = ""
    
    func updateProjType() -> String{
        if costSf == 0.0 {
            avConstructionCost.text = ""
            typeImage.image = UIImage(named: "x")
        } else if projType.selectedSegmentIndex == 0 {
            typeOfProj = "Demolition"
            typeImage.image = UIImage(named: "Demo")
            avConstructionCost.textColor = UIColor(red: 0.902, green: 0.2235, blue: 0.2745, alpha: 1.0)
            avConstructionCost.font = UIFont.boldSystemFont(ofSize: 18)
        } else if projType.selectedSegmentIndex == 1 {
            typeOfProj = "Renovation"
            typeImage.image = UIImage(named: "Reno")
            avConstructionCost.font = UIFont.boldSystemFont(ofSize: 18)
            avConstructionCost.textColor = UIColor(red: 0.4157, green: 0.6, blue: 0.3059, alpha: 1.0)
        } else if projType.selectedSegmentIndex == 2 {
            typeOfProj = "New Build"
            typeImage.image = UIImage(named: "NewBuild")
            avConstructionCost.textColor = UIColor(red: 0.2706, green: 0.4824, blue: 0.6157, alpha: 1.0)
            avConstructionCost.font = UIFont.boldSystemFont(ofSize: 18)
        }
        return typeOfProj
    }
    
    let singlestoryPrivate = 489.0..<637.0
    let midrisePrivate = 530.0..<1070.0
    let recPrivate = 547.0..<883.0
    let highrisePrivate = 630.0..<1201.0
    let govPrivate = 626.0..<1044.0
    let museumPrivate = 850.0..<1472.0
    let medicalPrivate = 651.0..<1218.0
    
    let singlestoryPublic = 289.0..<437.0
    let midrisePublic = 330.0..<870.0
    let recPublic = 347.0..<683.0
    let highrisePublic = 430.0..<1001.0
    let govPublic = 426.0..<844.0
    let museumPublic = 650.0..<1272.0
    let medicalPublic = 451.0..<1018.0
    
    let singlestoryCombo = 389.0..<537.0
    let midriseCombo = 430.0..<970.0
    let recCombo = 447.0..<783.0
    let highriseCombo = 530.0..<1101.0
    let govCombo = 526.0..<924.0
    let museumCombo = 750.0..<1372.0
    let medicalCombo = 551.0..<1118.0
    
    func updateFunding() {
        let typeName = updateProjType()
        var outputArray = ["\(typeName)\n"]
        
        if costSf == 0.0 {
            avConstructionCost.text = ""
            fundingImage.image = UIImage(named: "x")
        } else if fundingType.selectedSegmentIndex == 0 {
            fundingImage.image = UIImage(named: "Private")
            
            if costSf > 1472 {
                outputArray.append("- Museum/ Performing arts $850-$1472")
            } else if costSf < 489{
                outputArray.append("- Single story office $489-$637")
            } else {
                if singlestoryPrivate.contains(Double(Float(costSf))){
                    outputArray.append("- Single story office $489-$637")
                }
                if midrisePrivate.contains(Double(Float(costSf))) {
                    outputArray.append("- Mid-Rise Office $530-$1070")
                }
                if recPrivate.contains(Double(Float(costSf))) {
                    outputArray.append("- Recreation/ Gymnasiums    $547-$883")
                }
                if highrisePrivate.contains(Double(Float(costSf))){
                    outputArray.append("- High-rise Office $630-$1201")
                }
                if govPrivate.contains(Double(Float(costSf))){
                    outputArray.append("- Government buildings $626-$1044")
                }
                if museumPrivate.contains(Double(Float(costSf))){
                    outputArray.append("- Museum/ Performing arts $850-$1472")
                }
                if medicalPrivate.contains(Double(Float(costSf))){
                    outputArray.append("- Medical Office Buildings $651-$1218")
                }
            }
            
            let joinedOutput = outputArray.joined(separator: "\n")
            
            avConstructionCost.text = joinedOutput
            
        } else if fundingType.selectedSegmentIndex == 1 {
            fundingImage.image = UIImage(named: "Public")
            
            if costSf > 1272 {
                outputArray.append("- Museum/ Performing arts $650-$1272")
            } else if costSf < 289{
                outputArray.append("- Single story office $289-$437")
            } else {
                if singlestoryPublic.contains(Double(Float(costSf))){
                    outputArray.append("- Single story office $289-$437")
                }
                if midrisePublic.contains(Double(Float(costSf))) {
                    outputArray.append("- Mid-Rise Office $330-$870")
                }
                if recPublic.contains(Double(Float(costSf))) {
                    outputArray.append("- Recreation/ Gymnasiums    $347-$683")
                }
                if highrisePublic.contains(Double(Float(costSf))){
                    outputArray.append("- High-rise Office $430-$1001")
                }
                if govPublic.contains(Double(Float(costSf))){
                    outputArray.append("- Government buildings $426-$844")
                }
                if museumPublic.contains(Double(Float(costSf))){
                    outputArray.append("- Museum/ Performing arts $650-$1272")
                }
                if medicalPublic.contains(Double(Float(costSf))){
                    outputArray.append("- Medical Office Buildings $451-$1018")
                }
            }
            
            let joinedOutput = outputArray.joined(separator: "\n")
            
            avConstructionCost.text = joinedOutput
            
        } else if fundingType.selectedSegmentIndex == 2 {
            fundingImage.image = UIImage(named: "Partner")
            
            if costSf > 1372 {
                outputArray.append("- Museum/ Performing arts $750-$1372")
            } else if costSf < 389{
                outputArray.append("- Single story office $389-$537")
            } else {
                if singlestoryCombo.contains(Double(Float(costSf))){
                    outputArray.append("- Single story office $389-$537")
                }
                if midriseCombo.contains(Double(Float(costSf))) {
                    outputArray.append("- Mid-Rise Office $430-$970")
                }
                if recCombo.contains(Double(Float(costSf))) {
                    outputArray.append("- Recreation/ Gymnasiums    $447-$783")
                }
                if highriseCombo.contains(Double(Float(costSf))){
                    outputArray.append("- High-rise Office $530-$1101")
                }
                if govCombo.contains(Double(Float(costSf))){
                    outputArray.append("- Government buildings $526-$944")
                }
                if museumCombo.contains(Double(Float(costSf))){
                    outputArray.append("- Museum/ Performing arts $750-$1372")
                }
                if medicalCombo.contains(Double(Float(costSf))){
                    outputArray.append("- Medical Office Buildings $551-$1118")
                }
            }
            
            let joinedOutput = outputArray.joined(separator: "\n")
            
            avConstructionCost.text = joinedOutput
        }

    }
    
    
    @IBAction func fundingTypeControl(_ sender: UISegmentedControl) {
    }
    
    
    @IBAction func projectTypeControl(_ sender: UISegmentedControl) {
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)); view.addGestureRecognizer(tap)
        
        projCost?.delegate = self
        grossSF?.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
    
    
    
    @objc func keyboardWillHide(notification: NSNotification) { if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
}

