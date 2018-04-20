//
//  Flashcard.swift
//  Flashcards
//
//  Created by Zach Christensen on 2/22/18.
//

import Foundation

class Flashcard {
    
    var title : String
    var question : String
    var answer : String
    
    init(title : String, question: String, answer: String) {
        self.title = title
        self.question = question
        self.answer = answer
    }
}
