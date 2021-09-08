//
//  ViewController.swift
//  Image Swapper
//
//  Created by Taylor Tidwell on 8/31/21.
//
import AVKit
import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawingImage: UIImageView!
    @IBOutlet weak var drawingText: UILabel!
    
    var illustrationImage: [UIImage] = [
        UIImage(named: "Drawing_2")!,
        UIImage(named: "Drawing_3")!,
    ]
    
    //let url = URL(string:"https://youtu.be/nkagrDGQMa4")!
    
    let grey = UIColor(white: 0.9, alpha: 1)
    
    @IBAction func ChooseDrawing(_ sender: UIButton) {
        if sender.tag == 1 {
            drawingImage.image = UIImage(named:"Drawing_2")
            drawingText.textColor = .black
            drawingText.text = "Inspiration: The Splitting of a Rotten Heart, The Annihilation of Joy - Midnight Gospel"
        }
        else if sender.tag == 2 {
            drawingImage.image = UIImage(named:"Drawing_3")
            drawingText.textColor = .black
            drawingText.text = "Inspiration: Snowfall while driving"
        }
        else {
            drawingImage.image = UIImage(named:"CG_1")
            drawingText.textColor = .black
            drawingText.text = "Parametric planter bench with perforated & backlit steel paneling"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = grey
    }


}


