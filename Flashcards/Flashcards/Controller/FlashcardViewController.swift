//
//  FlashcardViewController.swift
//  Flashcards
//
//  Created by Carly on 4/19/18.
//  Copyright © 2018 Carly Chase. All rights reserved.
//
import UIKit

class FlashcardViewController: UIViewController {
    
    var lookAtMeJake:Collection = Collection(name: "null from flashcard")
    @IBOutlet weak var questionTextArea: UITextField!
    @IBOutlet weak var answerTextArea: UITextField!
    
    @IBAction func leftArrowButton(_ sender: UIButton) {
        print("<")
    }
    @IBAction func rightArrowButton(_ sender: UIButton) {
        print(">")
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
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n" + lookAtMeJake.name + " is the name of the collection passed to me")
        
        // Do any additional setup after loading the view.
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
