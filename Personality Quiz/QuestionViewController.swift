//
//  InterestsViewController.swift
//  Personality Quiz
//
//  Created by Janelle Law on 2017-11-06.
//  Copyright © 2017 Janelle Law. All rights reserved.

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBOutlet weak var FoodStackView: UIStackView!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var HobbiesStackView: UIStackView!
    
    @IBOutlet weak var L1: UILabel!
    @IBOutlet weak var L2: UILabel!
    @IBOutlet weak var L3: UILabel!
    @IBOutlet weak var L4: UILabel!
    @IBOutlet weak var L5: UILabel!
    @IBOutlet weak var L6: UILabel!
    @IBOutlet weak var L7: UILabel!
    @IBOutlet weak var L8: UILabel!
    
    
    @IBOutlet weak var S1: UISwitch!
    @IBOutlet weak var S2: UISwitch!
    @IBOutlet weak var S3: UISwitch!
    @IBOutlet weak var S4: UISwitch!
    @IBOutlet weak var S5: UISwitch!
    @IBOutlet weak var S6: UISwitch!
    @IBOutlet weak var S7: UISwitch!
    @IBOutlet weak var S8: UISwitch!
    
    
    func nextQuestion() {
        questionIndex += 1
    
        if questionIndex < questions.count {
            updateUI()
        } else {
           performSegue(withIdentifier: "Results", sender: nil)
        } 
    }

    @IBAction func SwitchPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if S1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if S2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if S3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if S4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        if S5.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        if S6.isOn {
            answersChosen.append(currentAnswers[1])
        }
        
        if S7.isOn {
            answersChosen.append(currentAnswers[0])
        }
        
        if S8.isOn {
            answersChosen.append(currentAnswers[2])
        }
    }
    
    @IBOutlet weak var TimeStackView: UIStackView!
    
    @IBOutlet weak var Morning: UILabel!
    @IBOutlet weak var Afternoon: UILabel!
    @IBOutlet weak var Evening: UILabel!
    @IBOutlet weak var Night: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderChanged() { //touchUpInside
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(slider.value *
            Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
    }
    
    @IBOutlet weak var qLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    var questions: [Question] = [
        
        Question(text: "What would you rather eat?",
                 type:.single, answers: [
                    Answer(text: "Dried Seaweed Snacks",  type: .tropicalFish),
                    Answer(text: "Clam Chowder", type: .octopus),
                    Answer(text: "Sushi", type: .dolphin),
                    Answer(text: "A Big Salmon Fillet", type: .shark),
                    ]),

        Question(text: "What do you like?",
                 type: .multiple, answers: [
                    Answer(text: "Playing sports", type: .shark),
                    Answer(text: "Listening to music", type: .dolphin),
                    Answer(text: "Solving puzzles", type: .octopus),
                    Answer(text: "Drawing / Visual Arts", type: .tropicalFish),
                    Answer(text: "Surfing the web / TV / Netflix", type: .tropicalFish),
                    Answer(text: "Hanging out with friends", type: .dolphin),
                    Answer(text: "A spacious bedroom", type: .shark),
                    Answer(text: "A cosy bedroom", type: .octopus),
                  ]),
    
        Question(text: "When are you most alert?",
                 type: .ranged,
                 
                 answers: [
                    Answer(text: "Morning", type: .tropicalFish),
                    Answer(text: "Afternoon", type: .dolphin),
                    Answer(text: "Evening", type: .shark),
                    Answer(text: "Night", type: .octopus),
            ])
       
    ]
    
    @IBAction func FoodButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case Button1:
            answersChosen.append(currentAnswers[3]) //fish
        case Button2:
            answersChosen.append(currentAnswers[2]) //octopus
        case Button3:
            answersChosen.append(currentAnswers[1]) //dolphin
        case Button4:
            answersChosen.append(currentAnswers[0]) //shark
        default:
            break
        }
        
       nextQuestion()
    }
    
    //set up q&a text
    func updateFoodStackView (using answers: [Answer]) {
        FoodStackView.isHidden = false
        Button1.setTitle(answers[0].text, for: .normal)
        Button2.setTitle(answers[1].text, for: .normal)
        Button3.setTitle(answers[2].text, for: .normal)
        Button4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateHobbiesStackView (using answers: [Answer]) {
        HobbiesStackView.isHidden = false
        L1.text = answers[0].text
        L2.text = answers[1].text
        L3.text = answers[2].text
        L4.text = answers[3].text
        L5.text = answers[4].text
        L6.text = answers[5].text
        L7.text = answers[6].text
        L8.text = answers[7].text
        
        S1.isOn = false
        S2.isOn = false
        S3.isOn = false
        S4.isOn = false
        S5.isOn = false
        S6.isOn = false
        S7.isOn = false
        S8.isOn = false
    }
    
    @IBAction func hobbySubmitPressed(_ sender: Any) {
       nextQuestion()
    }
    
    func updateTimeStackView(using answers: [Answer]) {
        TimeStackView.isHidden = false
        Morning.text = answers[0].text
        Afternoon.text = answers[1].text
        Evening.text = answers[2].text
        Night.text = answers[3].text
        
        slider.setValue(0.5, animated: false)
    }
    
    @IBAction func timeSubmitPressed(_ sender: Any) {
        nextQuestion()
    }
    
    //refresh questions
    func updateUI() {
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        FoodStackView.isHidden = true
        HobbiesStackView.isHidden = true
        TimeStackView.isHidden = true
        progressView.setProgress(totalProgress, animated: true)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        qLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        
        case .single:
            updateFoodStackView(using: currentAnswers)
        case .multiple:
            updateHobbiesStackView(using: currentAnswers)
        case .ranged:
            updateTimeStackView(using: currentAnswers)
            
        }
    }
    
    //send answer data to results view controller
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "Results" {
            let resultsViewController = segue.destination as!
            ResultViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
