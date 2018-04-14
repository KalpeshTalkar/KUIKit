//
//  ViewController.swift
//  Example
//
//  Created by Kalpesh Talkar on 14/04/18.
//  Copyright © 2018 Kalpesh Talkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: KTextField!
    @IBOutlet weak var textField2: KTextField!
    @IBOutlet weak var btn: KButton!
    @IBOutlet weak var btn2: KButton!
    @IBOutlet weak var progressbar: KProgressbar!
    @IBOutlet weak var circularProgressbar: KCircularProgressbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.onClick = {
            if self.textField1.isFirstResponder || self.textField2.isFirstResponder {
                self.view.endEditing(true)
            } else {
                let _ = self.textField1.becomeFirstResponder()
            }
        }
        btn2.onClick = {
            let progress = arc4random_uniform(100) + 1
            self.progressbar.setProgress(value: Int(progress), animated: true, animationDuration: 0.5, completion: { (completed) in
                print("Progressbar updated")
            })
            self.circularProgressbar.setProgress(progress: Float(progress)/100.0, animated: true, completion: { (completed) -> (Void) in
                print("Circular progressbar updated")
            })
        }
    }

}
