//
//  UIButtonExt.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/11/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

extension UIButton {
    //When is selected the background color changes
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.4922404289, green: 0.7722371817, blue: 0.4631441236, alpha: 1)
    }
    
    //When is deselected the background color changes
    func setDedselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.7464011312, green: 0.8857318759, blue: 0.7402122021, alpha: 1)
    }
}
