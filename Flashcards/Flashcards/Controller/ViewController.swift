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
    
    @IBAction func dropDownButton(_ sender: UIButton) {             //Menu button; when clicked, this hides or unhides the  "create a collection" and "create flashcards" buttons
        menuButtons.forEach	{ (button) in
            button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func createCollection(_ sender: UIButton) {           //TODO: Program button press to create a collection
        print("Tapped!")
    }
    
    
    @IBAction func createFlashcards(_ sender: UIButton) {           //TODO: Program button press to create flashcards
        print("Tapped!")
    }
    
}

