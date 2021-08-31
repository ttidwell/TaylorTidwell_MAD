//
//  ViewController.swift
//  Image Swapper
//
//  Created by Taylor Tidwell on 8/31/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawingImage: UIImageView!
    
    @IBAction func ChooseDrawing(_ sender: UIButton) {
        if sender.tag == 1 {
            drawingImage.image = UIImage(named:"Drawing_2")
        }
        else if sender.tag == 2 {
            drawingImage.image = UIImage(named:"Drawing_3")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

