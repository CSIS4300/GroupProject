//
//  HomeViewController.swift
//  Flashcards
//
//  Created by Sight Syndicate on 3/7/18.
//

import UIKit

class HomeViewController : UIViewController {
    
    @IBOutlet var menuButtons: [UIButton]!                          //Collection of Menu buttons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func dropDownButton(_ sender: UIButton) {             //DO NOT EDIT THIS FUNCTION
        menuButtons.forEach    { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
}
