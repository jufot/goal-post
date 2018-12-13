//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/10/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm

    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard() //The button moves up when the text view is selected
        shortTermBtn.setSelectedColor()
        longTermBtn.setDedselectedColor()
        goalTextView.delegate = self
    }
    
    //When the short term button is selected
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDedselectedColor()
    }
    
    //When the long term button is selected
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDedselectedColor()
    }
    
    //Next button
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if !goalTextView.text.isEmpty && goalTextView.text != "What is your goal?" {
            
            //When the create button is pressed: creates a customized view controller finishGoalVC with type FinishGoalVC
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC) //Calls the presented view controller (presentingViewController) and passes the desired customed view controller (finishGoalVC)
        }
    }
    
    //Back button
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    //The text view clears when the user starts to type
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    

}
