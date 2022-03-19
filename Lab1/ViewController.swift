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
    
    
    func updateFlashcardQuestions(question: String, answer: String){
        frontLabel.text = question
        backLabel.text = answer
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
            creationController.flashCardController = self
        
    }
    
}

