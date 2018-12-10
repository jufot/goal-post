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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //When the short term button is selected
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        
    }
    
    //When the long term button is selected
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        
    }
    
    //Next button
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
    }
    
    //Back button
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    

}
