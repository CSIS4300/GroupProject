//
//  ViewController.swift
//  Flashcards
//
//  Created by Carly Chase on 2/9/18.
//  Copyright © 2018 Carly Chase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var menuButtons: [UIButton]!                          //Collection of Menu buttons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dropDownButton(_ sender: UIButton) {             //DO NOT EDIT THIS FUNCTION
        menuButtons.forEach	{ (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    @IBAction func createCollection(_ sender: UIButton) {           //TODO: Program button press to create a collection
        print("Create collection pressed")
    }
    
    
    @IBAction func createFlashcards(_ sender: UIButton) {           //TODO: Program button press to create flashcards
        var question : UITextField!
        //var answer  : UITextField!
        let questionAlert = UIAlertController(title: "Create New Flashcard", message: "Flashcard Question", preferredStyle: .alert)
        
        questionAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            Void in
            
            if question.text != "" {
                //TODO: Do something with this data
                let newFlashcard = Flashcard(question: question.text!, answer: "nonthing for now")
                print(newFlashcard.question)
            } else {
                //TODO: Add error handling
            }
        }))
        questionAlert.addTextField { (textField) in
            question = textField
            textField.placeholder = "Question"
            textField.textAlignment = .center
        }
        self.present(questionAlert, animated: true, completion: nil)
        print("Create Flashcard pressed")
    }
    
}

