//
//  ViewController.swift
//  Touchid
//
//  Created by darshan on 18/01/18.
//  Copyright © 2018 darshan. All rights reserved.
//

import UIKit

import LocalAuthentication

class ViewController: UIViewController {

    @IBAction func btn_touch(_ sender: Any) {
    
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    [unowned self] success, authenticationError in
                    
                    DispatchQueue.main.async {
                        if success {
                            print("sucess")
                            //self.runSecretCode()
                        } else {
                            let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                            ac.addAction(UIAlertAction(title: "OK", style: .default))
                            self.present(ac, animated: true)
                        }
                    }
                }
            } else {
                let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

