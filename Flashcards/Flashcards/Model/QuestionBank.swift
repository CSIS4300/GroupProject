//
//  FlashcardData.swift
//  Flashcards
//
//  Created by Sight Syndicate on 4/20/18.
//

class QuestionBank {
    
    var list = [Flashcard]()
    
    init() {
        list.append(Flashcard(title: "Valentine", question: "Valentine\'s day is banned in Saudi Arabia.", answer: "yes"))
        list.append(Flashcard(title: "Slug", question: "A slug\'s blood is green.", answer: "yes"))
        list.append(Flashcard(title: "Bones", question: "Approximately one quarter of human bones are in the feet.", answer: "yes"))
    }
}
