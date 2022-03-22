//
//  CreationViewController.swift
//  Lab1
//
//  Created by Kennedy Emeruem on 3/13/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashCardController : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionFeild.text = initialQuestion
        answerFeild.text = initailAnswer
        
        editAnswerOne.text = initailOption1
        editAnswerTwo.text = initialOption2
        editAnswerThree.text = initialOption3
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }

    
    @IBOutlet weak var questionFeild: UITextField!
    @IBOutlet weak var answerFeild: UITextField!
    
    @IBOutlet weak var editAnswerOne: UITextField!
    @IBOutlet weak var editAnswerTwo: UITextField!
    @IBOutlet weak var editAnswerThree: UITextField!
    
    
    
    var initialQuestion: String?
    var initailAnswer: String?
    
    var initailOption1: String?
    var initialOption2: String?
    var initialOption3: String? 
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionFeild.text
        let answerText = answerFeild.text
        
        let optionOneText = editAnswerOne.text!
        let optionTwoText = editAnswerTwo.text
        let optionThreeText = editAnswerThree.text
        
        
        
        
        // create alert
        let alert: UIAlertController = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        // check if the text feild is empty and present string if that is the case
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty{
            
            present(alert, animated: true)
            
            
        } else {
            var isExisting = false
            if initialQuestion != nil{
                isExisting = true
            }
            flashCardController.updateFlashcardQuestions(question: questionText!, answer: answerText!, option1: optionOneText, option2: optionTwoText!, option3: optionThreeText!, isExisting: isExisting)
            dismiss(animated: true)
        }
        
        
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
