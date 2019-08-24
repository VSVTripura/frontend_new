//
//  RegisterViewController.swift
//  Test1
//
//  Created by apple on 19/08/19.
//  Copyright © 2019 DBS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Textfield1: UITextField!
    @IBOutlet weak var Textfield2: UITextField!
    @IBOutlet weak var Textfield4: UITextField!
    
    
    @IBOutlet weak var Textfield3: UITextField!
    @IBOutlet weak var myButton2: UIButton!
    @IBAction func savePassenger(_ sender: Any) {
        let name = self.Textfield1.text!
        let email = self.Textfield2.text!
        let password = self.Textfield3.text!
        let contact=self.Textfield4.text!
        
        
       
        AF.request("http://localhost:8080/regPage?name=\(name)&email=\(email)&password=\(password)&contact=\(contact)").validate()
        UserDefaults.standard.set(email, forKey: "email")
        
        self.Textfield1.text = ""
        self.Textfield2.text = ""
        self.Textfield3.text = ""
        self.Textfield4.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton2.layer.cornerRadius = myButton2.frame.size.height/2
        myButton2.layer.masksToBounds = true
        
        myButton2.setGradientBackground(colorOne: UIColor.red, colorTwo: UIColor.black)
        Textfield1.delegate = self
        
        Textfield2.delegate = self
        Textfield3.delegate = self
        Textfield4.delegate = self 
     

    }
    

    

}
