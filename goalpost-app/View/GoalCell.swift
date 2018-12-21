//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/4/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    //Defines the objects in view controller with the objects in the storyboard
    func configureCell(goal: Goal) {
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
    }
}
