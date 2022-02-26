//
//  ViewController.swift
//  Lab1
//
//  Created by Kennedy Emeruem on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        card.layer.cornerRadius = 20
    }


    @IBOutlet weak var card: UIView!
    
    @IBAction func didTapOnFlashcard(_ sender: Any){
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        } else{
            frontLabel.isHidden = false
        }

    }
    
    
    
}

