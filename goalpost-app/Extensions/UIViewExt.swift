//
//  UIViewExt.swift
//  goalpost-app
//
//  Created by Jeremiah Ufot on 12/11/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

extension UIView {
    //Function creates an observer that observes the IOS notification that's sent when the keyboard changes/opens frame
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    //Function that animates the frame of the object we bind to the keyboard; so it will move up with the keyboard
    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duaration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duaration, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    
}
