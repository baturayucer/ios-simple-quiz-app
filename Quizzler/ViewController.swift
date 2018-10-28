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
    var indexofQuestions = 0
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
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(indexofQuestions + 1) / \(allQuestions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(indexofQuestions + 1)
    }
    

    func nextQuestion() {
        
        if indexofQuestions <= allQuestions.list.count - 1 {
            questionLabel.text = allQuestions.list[indexofQuestions].questionText
        } else {
            showAlertMessage(title: "Score: \(score) ", message: "Game is ended. Would you like to replay?", actiontitle: "yes")
            //startOver()
        }
        
    }
    
    
    func checkAnswer() {

        if allQuestions.list[indexofQuestions].answer == pickedAnswer {
            //showAlertMessage(title: "Awesome!", message: "Your answer is Right", actiontitle: "next question")
            indexofQuestions += 1
            updateUI(answer: true)
        }else {
            //showAlertMessage(title: "Oh!", message: "Your  answer is wrong!", actiontitle: "next question")
            indexofQuestions += 1
            updateUI(answer: false)
        }

    }
    
    func showAlertMessage(title: String,message: String,actiontitle: String) {
        let alert1 = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction1 = UIAlertAction(title: actiontitle, style: .default){ (action:UIAlertAction) in
            self.startOver()
        }
        alert1.addAction(restartAction1)
        present(alert1, animated: true, completion: nil)
    }
    
    
    func startOver() {

        indexofQuestions = 0
        score = 0
        updateUI(answer: false)
        questionLabel.text = allQuestions.list[indexofQuestions].questionText
    }
    
}
