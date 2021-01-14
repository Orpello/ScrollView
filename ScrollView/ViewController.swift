//
//  ViewController.swift
//  ScrollView
//
//  Created by Gianluca Orpello on 13/01/21.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var formScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registerForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    @objc func keyboardWasShown(_ notification: NSNotification) {
        
        guard let info = notification.userInfo else {
            return
        }
        
        guard let keyboardFrame = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        
        let keybordSize = keyboardFrame.cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keybordSize.height, right: 0.0)
        formScrollView.contentInset = contentInsets
        formScrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification){
        
        let contentInsets = UIEdgeInsets.zero
        formScrollView.contentInset = contentInsets
        formScrollView.scrollIndicatorInsets = contentInsets
        
    }
    
}

