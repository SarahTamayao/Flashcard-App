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
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    
    
    @IBOutlet weak var card: UIView!
    
    //buttons for the options
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    
    var flashcards = [Flashcard]()
    
    
    //current index oof flashcard
    var currentIndex = 0
    
    // rgba(96,156,254,255)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // style the card
        card.layer.cornerRadius = 25
        frontLabel.layer.cornerRadius = 25
        backLabel.layer.cornerRadius = 25
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        card.layer.shadowRadius = 15
        card.layer.shadowOpacity = 0.2
        
        // style the buttons
        btnOptionOne.layer.cornerRadius = 12
        btnOptionTwo.layer.cornerRadius = 12
        btnOptionThree.layer.cornerRadius = 12
        
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        
        prevButton.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        prevButton.layer.borderWidth = 3.0
        prevButton.layer.cornerRadius = 26
        
        nextButton.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        nextButton.layer.borderWidth = 3.0
        nextButton.layer.cornerRadius = 26
        
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
            updateFlashcardQuestions(question: "What is my name", answer: "John", option1: "Kennedy", option2: "John", option3: "NOT KENNEDY", isExisting: false)
        } else{
            updateLabels()
            updateNextPrevButtons()
        }
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any){
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
        } else{
            frontLabel.isHidden = false
        }

    }
    struct Flashcard {
        var question: String
        var answer: String
        
        var option1: String
        var option2: String
        var option3: String
    }
    
    func updateFlashcardQuestions(question: String, answer: String, option1: String, option2: String, option3: String, isExisting: Bool){
        let flashcard = Flashcard(question: question, answer: answer, option1: option1, option2: option2, option3: option3)
        
        if isExisting {
            flashcards[currentIndex] = flashcard
            updateLabels()
            updateNextPrevButtons()
            saveAllFlashcardsToDisk()
        }else{
            flashcards.append(flashcard)
    //        print("Added a new flashcard")
    //        print("we have \(flashcards.count) flashcards")
            
    //        currentIndex = flashcards.count - 1
            
    //        print("current index is \(currentIndex)")
            
            updateNextPrevButtons()
            updateLabels()
            
            saveAllFlashcardsToDisk()
        }
            
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
            creationController.flashCardController = self
        
        // make sure that when you click the + button you get a blank slate to edit
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initailAnswer = backLabel.text
            
            creationController.initailOption1 = btnOptionOne.titleLabel?.text
            creationController.initialOption2 = btnOptionTwo.titleLabel?.text
            creationController.initialOption3 = btnOptionThree.titleLabel?.text
        }
        
        
    }
    @IBAction func didTapOnOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOnOptionTwo(_ sender: Any) {
        if frontLabel.isHidden == false {
            frontLabel.isHidden = true
            
        }
        btnOptionOne.isHidden = false
        btnOptionThree.isHidden = false
    }
    
    @IBAction func didTaponOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func updateNextPrevButtons() {
        //disable the next button if at the end of the list
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
            nextButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        } else {
            nextButton.isEnabled = true
            nextButton.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        }
        
        //disable the prev button if at the begining
        if currentIndex == 0 {
            prevButton.isEnabled = false
            prevButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        } else {
            prevButton.isEnabled = true
            prevButton.layer.borderColor = #colorLiteral(red: 0.3800600767, green: 0.6058393717, blue: 0.9970840812, alpha: 1)
        }
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        frontLabel.isHidden = false
        btnOptionOne.setTitle(currentFlashcard.option1, for: .normal)
        btnOptionTwo.setTitle(currentFlashcard.option2, for: .normal)
        btnOptionThree.setTitle(currentFlashcard.option3, for: .normal)
    }
    
    // Save flashcards to memory
    func saveAllFlashcardsToDisk() {
        
        //from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question" : card.question, "answer": card.answer, "option 1": card.option1, "option 2": card.option2, "option 3": card.option3]
            
        }
        
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved")
    }
    
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            let savedCards = dictionaryArray.map {
                dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, option1: dictionary["option 1"]!, option2: dictionary["option 2"]!, option3: dictionary["option 3"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
        }
        
        
        
    }
    
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {
            action in self.deleteCurrentFlashcard()
        }
        
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard() {
        
        
        if currentIndex == 0 && flashcards.count == 1{
            print("This works")
            updateFlashcardQuestions(question: "Empty Question", answer: "Empty Answer", option1: "Empty Option", option2: "Empty Option", option3: "Empty Option", isExisting: false)
            flashcards.remove(at: 0)
            updateLabels()
            updateNextPrevButtons()
            saveAllFlashcardsToDisk()
        } else {
            flashcards.remove(at: currentIndex)
            
            if currentIndex > flashcards.count - 1 {
                currentIndex = flashcards.count - 1
            }
            
            updateLabels()
            updateNextPrevButtons()
            saveAllFlashcardsToDisk()
        }
            
        
    }
    
    
}

