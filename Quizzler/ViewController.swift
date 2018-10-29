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
            progressLabel.text = "\(indexofQuestions) / \(allQuestions.list.count)"
            showAlertMessage(title: "Score: \(score) ", message: "Game is ended. Would you like to start over?", actiontitle: "yes")
            //startOver()
        }
        
    }
    
    
    func checkAnswer() {

        if allQuestions.list[indexofQuestions].answer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            indexofQuestions += 1
            updateUI(answer: true)
        }else {
            ProgressHUD.showError("Wrong!")
            indexofQuestions += 1
            updateUI(answer: false)
        }

    }
    
    func showAlertMessage(title: String,message: String,actiontitle: String) {
        let endAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let endAction = UIAlertAction(title: actiontitle, style: .default){ (action:UIAlertAction) in
            self.startOver()
        }
        endAlert.addAction(endAction)
        present(endAlert, animated: true, completion: nil)
    }
    
    
    func startOver() {
        indexofQuestions = 0
        score = 0
        updateUI(answer: false)
        questionLabel.text = allQuestions.list[indexofQuestions].questionText
    }
    
}
