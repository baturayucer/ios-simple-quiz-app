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
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(answer: false)
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
    
    func updateUI(answer: Bool) {
        if(answer == true) {
            score += 1
        }
        scoreLabel.text = "Scorea: \(score)"
        progressLabel.text = "\(score) / \(allQuestions.list.count)"
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
            updateUI(answer: true)
            print("Question.\(indexofQuestions+1) score:",score)
            
        }else {
            //showAlertMessage(title: "Oh!", message: "Your  answer is wrong!", actiontitle: "next question")
            updateUI(answer: false)
            print("Question.\(indexofQuestions+1) score:",score)
        }

    }
    
    func showAlertMessage(title: String,message: String,actiontitle: String) {
        let alert1 = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction1 = UIAlertAction(title: actiontitle, style: .default)
        alert1.addAction(restartAction1)
        present(alert1, animated: true, completion: nil)
    }
    
    
    func startOver() {
        showAlertMessage(title: "Score: \(score) ", message: "Game is ended. Would you like to replay?", actiontitle: "yes")
        indexofQuestions = 0
        score = 0
        updateUI(answer: false)
        questionLabel.text = allQuestions.list[indexofQuestions].questionText
    }
    
}
