//
//  LoginViewController.swift
//  loginAttempt3
//
//  Created by Michael Hall on 7/10/17.
//  Copyright © 2017 Hall Enterprises. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userPasswordTextfield: UITextField!
    @IBOutlet weak var userEmailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logginButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextfield.text;
        let userPassword = userPasswordTextfield.text;
        
        //Check for empty fields
        if(userEmail == "" || userPassword == ""){
            
            //Display alery message
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
       

        
        //From phone validation
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        let userUsernameStored = UserDefaults.standard.string(forKey: "userUsername");
        
        if(userEmailStored == userEmail || userUsernameStored == userEmail ){
            
            if(userPasswordStored == userPassword){
            //Login is successful
                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
                self.dismiss(animated: true,completion:nil);
            }
            else{
                displayMyAlertMessage(userMessage: "Username or Password is incorrect");
                return;
            }
        }
        else{
            displayMyAlertMessage(userMessage: "Username or Password is incorrect");
            return;
        }


}
    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true , completion:nil);
    }
}
