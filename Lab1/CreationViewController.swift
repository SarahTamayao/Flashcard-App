//
//  CreationViewController.swift
//  Lab1
//
//  Created by Kennedy Emeruem on 3/13/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashCardController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }

    
    @IBOutlet weak var questionFeild: UITextField!
    @IBOutlet weak var answerFeild: UITextField!
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionFeild.text
        let answerText = answerFeild.text
        
        flashCardController.updateFlashcardQuestions(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
