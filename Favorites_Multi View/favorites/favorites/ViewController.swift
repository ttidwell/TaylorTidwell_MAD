//
//  ViewController.swift
//  favorites
//
//  Created by Taylor Tidwell on 9/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var user = Favorite()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        bookLabel.text = user.favBook
        authorLabel.text = user.favAuthor
    }

}

