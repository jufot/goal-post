//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/4/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit
import CoreData

//Creates an appdelegate object and allows public access
let appDelegate = UIApplication.shared.delegate as? AppDelegate


class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
//        let goal = Goal()
//        goal.goalCompletionValue = Int32(exactly: 12.0)!
        
    }
    //When the add button is pressed: creates a customized view controller
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //Cell is created
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell() }
        cell.configureCell(description: "Eat salad twice a week", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
    
    
}

