//
//  Question.swift
//  Quizzler
//
//  Created by Baturay on 21.10.2018.
//  Copyright © 2018 Baturay Ucer. All rights reserved.
//

import Foundation

class Question {
    //properties
    let questionText : String
    let answer : Bool
    
    //event init
    init(text: String, correctAnswer: Bool) {
        questionText = text;
        answer = correctAnswer;
    }
    
}
