//
//  MainViewController.swift
//  Timer
//
//  Created by Damon Cricket on 20.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var hoursView: UIView?
    
    @IBOutlet weak var minutesView: UIView?
    
    @IBOutlet weak var secondsView: UIView?
    
    @IBOutlet weak var hoursTextField: UITextField?
    
    @IBOutlet weak var minutesTextField: UITextField?
    
    @IBOutlet weak var secondsTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        hoursView?.layer.cornerRadius = 5.0
        minutesView?.layer.cornerRadius = 5.0
        secondsView?.layer.cornerRadius = 5.0
    }
    
    @IBAction func tapGestureRecognizer(sender: UITapGestureRecognizer) {
        if hoursTextField!.isFirstResponder {
            hoursTextField?.resignFirstResponder()
        } else if minutesTextField!.isFirstResponder {
            minutesTextField!.resignFirstResponder()
        } else if secondsTextField!.isFirstResponder {
            secondsTextField!.resignFirstResponder()
        }
    }
}
