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
    
    let singlestoryPrivate = 289..<437
    let singlestoryPublic = 89..<237
    let singlestoryCombo = 189..<337
    
//    let midrisePrivate =
//    let midrisePublic =
//    let midriseCombo =
//
//    let recPrivate =
//    let recPublic =
//    let recCombo =
//
//    let highrisePrivate =
//    let highrisePublic =
//    let highriseCombo =
//
//    let govPrivate =
//    let govPublic =
//    let govCombo =
//
//    let museumPrivate =
//    let museumPublic =
//    let museumCombo =
//
//    let medicalPrivate =
//    let medicalPublic =
//    let medicalCombo =
    
    func updateFunding() {
        let typeName = updateProjType()
        
        if costSf == 0.0 {
            avConstructionCost.text = ""
            fundingImage.image = UIImage(named: "x")
        } else if fundingType.selectedSegmentIndex == 0 {
            fundingImage.image = UIImage(named: "Private")
            if costSf > 1300 {
                avConstructionCost.text = "\(typeName)\n\n- Museum/ Performing arts $650-$1272"
            } else if costSf < 1300 && costSf > 650{
                avConstructionCost.text = "\(typeName)\n\n- Museum/ Performing arts $650-$1272\n- Medical Office Buildings $451-$1018\n- Government buildings $426-$844\n- Mid-Rise Office $330-$870\n- High-rise Office $430-$1001"
            } else if costSf < 685 && costSf > 426 {
                avConstructionCost.text = "\(typeName)\n\n- Medical Office Buildings $451-$1018\n- Government buildings $426-$844\n- Mid-Rise Office $330-$870\n- High-rise Office $430-$1001"
            } else if costSf < 430 && costSf > 289 {
                avConstructionCost.text = "\(typeName)\n\n- Single story office $289-$437\n- Mid-Rise Office $330-$870\n- High-rise Office $430-$1001"
            } else {
                avConstructionCost.text = "\(typeName)\n\n- Single story office $289-$437"
            }
        } else if fundingType.selectedSegmentIndex == 1 {
            fundingImage.image = UIImage(named: "Public")
            if costSf > 1100 {
                avConstructionCost.text = "\(typeName)\n\n- Museum/ Performing arts $450-$1072"
            } else if costSf < 1100 && costSf > 450{
                avConstructionCost.text = "\(typeName)\n\n- Museum/ Performing arts $450-$1072\n- Medical Office Buildings $251-$818\n- Government buildings $226-$644\n- Mid-Rise Office $130-$670\n- High-rise Office $230-$801"
            } else if costSf < 485 && costSf > 226 {
                avConstructionCost.text = "\(typeName)\n\n- Medical Office Buildings $251-$818\n- Government buildings $226-$644\n- Mid-Rise Office $230-$670\n- High-rise Office $230-$801"
            } else if costSf < 230 && costSf > 150 {
                avConstructionCost.text = "\(typeName)\n\n- Single story office $89-$137\n- Mid-Rise Office $130-$670\n- High-rise Office $230-$801"
            } else {
                avConstructionCost.text = "\(typeName)\n\n- Single story office $89-$237"
            }
        } else if fundingType.selectedSegmentIndex == 2 {
            fundingImage.image = UIImage(named: "Partner")
            if costSf > 1200 {
                avConstructionCost.text = "\(typeName)\n\n- Museum/ Performing arts $550-$1172"
            } else if costSf < 1200 && costSf > 550{
                avConstructionCost.text = "\(typeName)\n\n- Museum/ Performing arts $550-$1172\n- Medical Office Buildings $351-$918\n- Government buildings $326-$744\n- Mid-Rise Office $230-$770\n- High-rise Office $330-$901"
            } else if costSf < 585 && costSf > 326 {
                avConstructionCost.text = "\(typeName)\n\n- Medical Office Buildings $351-$918\n- Government buildings $326-$744\n- Mid-Rise Office $230-$770\n- High-rise Office $330-$901"
            } else if costSf < 330 && costSf > 200 {
                avConstructionCost.text = "\(typeName)\n\n- Single story office $189-$337\n- Mid-Rise Office $230-$770\n- High-rise Office $330-$901"
            } else {
                avConstructionCost.text = "\(typeName)\n\n- Single story office $189-$337"
            }
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

