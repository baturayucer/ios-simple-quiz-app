//
//  ViewController.swift
//  Quizzler
//
//
//  Copyright (c)  Baturay Ucer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    var indexofQuestions = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()

    }
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        indexofQuestions += 1
        if indexofQuestions <= allQuestions.list.count - 1 {
            questionLabel.text = allQuestions.list[indexofQuestions].questionText
        } else {
            startOver()
        }
        
    }
    
    
    func checkAnswer() {

        if allQuestions.list[indexofQuestions].answer == pickedAnswer {
            //showAlertMessage(title: "Awesome!", message: "Your answer is Right", actiontitle: "next question")
            print("\(indexofQuestions + 1).correct")
        }else {
            //showAlertMessage(title: "Oh!", message: "Your  answer is wrong!", actiontitle: "next question")
            print("\(indexofQuestions + 1).wrong")
        }

    }
    
    func showAlertMessage(title: String,message: String,actiontitle: String) {
        let alert1 = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction1 = UIAlertAction(title: actiontitle, style: .default)
        alert1.addAction(restartAction1)
        present(alert1, animated: true, completion: nil)
    }
    
    
    func startOver() {
        showAlertMessage(title: "End of the game", message: "Game is ended. Would you like to replay?", actiontitle: "yes")
        indexofQuestions = 0
        questionLabel.text = allQuestions.list[indexofQuestions].questionText
    }
    

    
}
