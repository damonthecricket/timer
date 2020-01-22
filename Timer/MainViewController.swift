//
//  MainViewController.swift
//  Timer
//
//  Created by Damon Cricket on 20.01.2020.
//  Copyright © 2020 DC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var hoursView: UIView?
    
    @IBOutlet weak var minutesView: UIView?
    
    @IBOutlet weak var secondsView: UIView?
    
    @IBOutlet weak var hoursTextField: UITextField?
    
    @IBOutlet weak var minutesTextField: UITextField?
    
    @IBOutlet weak var secondsTextField: UITextField?
    
    @IBOutlet weak var startButton: UIButton?
    
    var timer: Timer? = nil
    
    deinit {
        stop()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        hoursView?.layer.cornerRadius = 5.0
        minutesView?.layer.cornerRadius = 5.0
        secondsView?.layer.cornerRadius = 5.0
        
        startButton?.layer.borderColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0).cgColor
        startButton?.layer.borderWidth = 2.0
        startButton?.layer.cornerRadius = startButton!.frame.width/2.0
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        let new = (text as NSString).replacingCharacters(in: range, with: string)
        return new.count < 3
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        if text.isEmpty {
            textField.text = "00"
        } else if text.count == 1 {
            textField.text = "0\(text)"
        }
    }
    
    @IBAction func startButtonTap(sender: UIButton) {
        if total() != 0 && timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick(timer:)), userInfo: nil, repeats: true)
            startButton?.setTitle("Stop", for: .normal)
        } else if timer != nil {
            stop()
        }
    }
    
    @objc func timerTick(timer: Timer) {
        let ttl = total()
        let remain = ttl - 1
        var seconds = remain
        let hours = seconds/60*60
        seconds -= hours*60*60
        let minutes = seconds/60
        seconds -= minutes*60
        hoursTextField?.text = valid(text: "\(hours)")
        minutesTextField?.text = valid(text: "\(minutes)")
        secondsTextField?.text = valid(text: "\(seconds)")
        if remain == 0 {
            stop()
        }
    }
    
    func total() -> Int {
        let hours = hoursTextField!.integer
        let minutes = minutesTextField!.integer
        let seconds = secondsTextField!.integer
        return hours*60*60 + minutes*60 + seconds
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        startButton?.setTitle("Start", for: .normal)
    }
    
    func valid(text: String) -> String {
        if text.isEmpty {
            return "00"
        } else if text.count == 1 {
            return "0\(text)"
        } else {
            return text
        }
    }
}

extension UITextField {
    var integer: Int {
        return text != nil ? (text! as NSString).integerValue : 0
    }
}
