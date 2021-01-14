//
//  ViewController.swift
//  ScrollView
//
//  Created by Gianluca Orpello on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registerForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        
    }
    
    @objc func keyboardWasShown(_ notification: NSNotification) {
        print(#function)
    }
    
}

