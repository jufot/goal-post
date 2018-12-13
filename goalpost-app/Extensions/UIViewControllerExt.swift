//
//  UIViewControllerExt.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/10/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

extension UIViewController {
    //Presents view controller from the right
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let presentedViewController = presentedViewController else { return }
        
        //Overrides animation and presents the new view controller
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    
    //Dismisses view controller from the left
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: true, completion: nil)
    }
}


