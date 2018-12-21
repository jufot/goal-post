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
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false  //Show tableview if there is at least one goal
                } else {
                    tableView.isHidden = true   //Hide tableview if there's no data
                }
            }
        }
        tableView.reloadData()
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
        return goals.count
    }
    
    //Cell is created
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        
        cell.configureCell(goal: goal)
        return cell
    }
    
    
}

extension GoalsVC {
    //Function that accepts a completion handler: It creates a constant to hold the managed object context and a fetch request which will retrieve data from the persistent storage coordinator
    func fetch(completion: (_ complete: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try managedContext.fetch(fetchRequest) as! [Goal]   //Fetching the data
            print("Successfully fetched data.")
            completion(true)
        } catch {
            debugPrint("Error: \(error.localizedDescription)")  //Catching the error
            completion(false)
        }
    }
    
    
    
    
}

