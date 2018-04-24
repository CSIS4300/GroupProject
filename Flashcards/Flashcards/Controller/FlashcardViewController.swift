//
//  FlashcardViewController.swift
//  Flashcards
//
//  Created by Carly on 4/19/18.
//  Copyright © 2018 Carly Chase. All rights reserved.
//
import UIKit

class FlashcardViewController: UIViewController {
    
    var passedCollection:Collection = Collection(name: "null from flashcard")
    var currentPosition = 0
    var maxPosition = 0
    @IBOutlet weak var questionTextArea: UITextField!
    @IBOutlet weak var answerTextArea: UITextField!
    
    @IBAction func leftArrowButton(_ sender: UIButton) {
        passedCollection.flashcards[currentPosition].question = questionTextArea.text!
        passedCollection.flashcards[currentPosition].answer = answerTextArea.text!
        
        currentPosition-=1
        setFlashcardText()
    }
    @IBAction func rightArrowButton(_ sender: UIButton) {
        passedCollection.flashcards[currentPosition].question = questionTextArea.text!
        passedCollection.flashcards[currentPosition].answer = answerTextArea.text!
        
        currentPosition+=1
        if (currentPosition >= maxPosition){
            maxPosition+=1
            passedCollection.flashcards.append(Flashcard(title: "empty", question: "Enter a question", answer: "Enter an answer"))
            setFlashcardText()
        }
        else {
            setFlashcardText()
        }
    }
    @IBAction func flipButton(_ sender: UIButton) {
        print("flip")
        if (questionTextArea.isHidden){
            questionTextArea.isHidden = false
            answerTextArea.isHidden = true
        }
        else if (answerTextArea.isHidden){
            questionTextArea.isHidden = true
            answerTextArea.isHidden = false
        }
        
    }
    
    func setFlashcardText(){
        if (currentPosition < 0){
            currentPosition = 0;
        }
        else {
            questionTextArea.text = passedCollection.flashcards[currentPosition].question
            answerTextArea.text = passedCollection.flashcards[currentPosition].answer
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFlashcardText()
        print("\n" + passedCollection.name + " is the name of the collection passed to me")
        maxPosition = passedCollection.flashcards.count

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
