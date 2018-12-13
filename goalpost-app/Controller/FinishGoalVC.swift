//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/12/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    //Creates and saves goal by calling the save function
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            // Pass data into the Core Data Goal Model
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    //Back Button
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    //Takes a completion handler, which has a function that determines if the data was successfully saved
    func save(completion: (_ finished: Bool) -> ()) {
        //Created an instance of the Goal class and created a context for the data to be saved
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        //Saves data to context (Core Data) and catches the error if it fails
        do {
           try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
    }
    
}







