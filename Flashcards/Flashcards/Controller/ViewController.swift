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
    
    @IBAction func createCollection(_ sender: UIButton) {
        var collection : UITextField!
        let alert = UIAlertController(title: "Create New Collection", message: "Flashcard Collection Name", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            Void in
            
            if collection.text != "" {
                //TODO: Do something with this data
                var collect = Collection(name: collection.text!)
                print(collection.text!)
            } else {
                //TODO: Add error handling
            }
        }))
        alert.addTextField { (textField) in
            collection = textField
            textField.placeholder = "Collection Name"
            textField.textAlignment = .center
        }
        self.present(alert, animated: true, completion: nil)
        print("Create collection pressed")
    }
    
    
    @IBAction func createFlashcards(_ sender: UIButton) {           //TODO: Program button press to create flashcards
                print("Create Flashcard pressed")
    }
    
}

