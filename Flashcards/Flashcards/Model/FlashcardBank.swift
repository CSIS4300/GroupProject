//
//  FlashcardBank.swift
//  Flashcards
//
//  Created by Sight Syndicate on 2/22/18.
//  Copyright © 2018 Carly Chase. All rights reserved.
//

import Foundation

class FlashcardBank {
    
    var list = [Flashcard]()
    
    init() {
        // Add items to flash cards ## For Temp use ##
        
        list.append(Flashcard(question: "It is illegal to pee in the Ocean in Portugal", answer: "true", collection: "Econ"))
        list.append(Flashcard(question: "The color of the sky is..", answer: "blue", collection: "Finance"))
        list.append(Flashcard(question: "____ affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog", answer: "chocolate", collection: "CSIS 4300"))
        list.append(Flashcard(question: "The totla surface area of two human lungs is approximately _____", answer: "70 square meters", collection: "Econ"))
        list.append(Flashcard(question: "Approximately one quarter of human bones are in the feet.", answer: "true", collection: "Finance"))
        list.append(Flashcard(question: "Google was originally called \"Backrub\"", answer: "true", collection: "CSIS 4300"))
        
    }
}
