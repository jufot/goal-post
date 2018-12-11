//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/10/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
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
        
    }
    
    //Back button
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    

}
