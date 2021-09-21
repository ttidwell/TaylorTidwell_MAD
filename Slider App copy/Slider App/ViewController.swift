//
//  ViewController.swift
//  Slider App
//
//  Created by Taylor Tidwell on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    @IBOutlet weak var posterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var fontSize: UILabel!
    @IBOutlet weak var capitolSwitch: UISwitch!
    
    
    func updateImage(){
        if posterSegmentedControl.selectedSegmentIndex == 0 {
            posterLabel.text = "Lava Lamp"
            posterImage.image = UIImage(named: "poster_2")
        } else if posterSegmentedControl.selectedSegmentIndex == 1{
            posterLabel.text = "Contour Map"
            posterImage.image = UIImage(named: "poster_3")
        }
    }
    
    func updateCaps(){
        if capitolSwitch.isOn {
            //capitolize text
            posterLabel.text = posterLabel.text?.uppercased()
            posterLabel.textColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        } else {
            //lower case text
            posterLabel.text = posterLabel.text?.capitalized
            posterLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
    @IBAction func changePoster(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSizeLabel = sender.value
        
        //convert the float fontSize to string
        fontSize.text = String(format: "%.0f", fontSizeLabel)
        let fontSizeCGFloat = CGFloat(fontSizeLabel)
        posterLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
//    func refreshUI(){
//        posterLabel.text=""
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

