//
//  ViewController.swift
//  Firebase_Login
//
//  Created by Master on 5/27/16.
//  Copyright © 2016 Master. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_pwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_create_new_account_tapped(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(self.txt_email.text!, password: self.txt_pwd.text!, completion: { (user:FIRUser?, error: NSError?) in
            if error != nil{
                print("Account Creation Error: \(error!.localizedDescription)")
                self.login()
            }else{
                print("Account Created!")
                self.login()
            }
        })
    }

    func login(){
        FIRAuth.auth()?.signInWithEmail(self.txt_email.text!, password: self.txt_pwd.text!, completion: { (user:FIRUser?, error: NSError?) in
            if error != nil{
                print("Error: \(error!.localizedDescription)")
            }else{
                print("Success in Login!")
            }
            
        })
    }
}

