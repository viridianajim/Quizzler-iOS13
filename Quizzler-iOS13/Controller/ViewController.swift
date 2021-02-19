//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //var questionsCorrect = 0
    var quizBrain = QuizBrain()

   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress=0
        
        
        // Do any additional setup after loading the view.
        
        
        updateUI()
    }

    @IBAction func answeredButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!//True or false

        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            print("right")
            sender.backgroundColor = UIColor.green
            
            //questionsCorrect += 1
            //print(questionsCorrect)
            progressBar.progress = quizBrain.getProcess()
        }
        else{
            print("wrong")
            sender.backgroundColor = UIColor.red
        }
   
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    
    @objc func updateUI(){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getText()
        progressBar.progress = quizBrain.getProcess()
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        
        
    }
    
}

