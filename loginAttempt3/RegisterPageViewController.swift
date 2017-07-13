//
//  RegisterPageViewController.swift
//  loginAttempt3
//
//  Created by Michael Hall on 7/9/17.
//  Copyright © 2017 Hall Enterprises. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

  
    @IBOutlet weak var UserRepeatPasswordTextfield: UITextField!
    @IBOutlet weak var UserPasswordTextfield: UITextField!
    @IBOutlet weak var UserEmailTextfield: UITextField!
    @IBOutlet weak var UsernameTextfield: UITextField!
    
    override func viewDidLoad() {
  

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonTapped(_ sender: UIButton) {
    
        let userEmail = UserEmailTextfield.text;
        let userPassword = UserPasswordTextfield.text;
        let userRepeatPassword = UserRepeatPasswordTextfield.text;
        let userUsername = UsernameTextfield.text;

        //Check for empty fields
        if(userEmail == "" || userPassword == "" ||  userRepeatPassword == "" || userUsername == ""){
            
            //Display alery message
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        //Check if passwords match
        if(userPassword != userRepeatPassword){
            //Display alery message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return;
        }
        
        //Store data
        UserDefaults.standard.set(userEmail,forKey: "userEmail");
        UserDefaults.standard.set(userPassword,forKey: "userPassword");
        UserDefaults.standard.set(userUsername,forKey: "userUsername");
        
       // UserDefaults.standardUserDefaults.synchrnize();

        //Display alert message with confirmation
        var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!",preferredStyle:UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion:nil);
        }
        myAlert.addAction(okAction);
        self.present(myAlert,animated:true,completion:nil);
        
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true , completion:nil);
    }
}
