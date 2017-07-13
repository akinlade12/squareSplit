//
//  ViewController.swift
//  loginAttempt3
//
//  Created by Michael Hall on 7/9/17.
//  Copyright © 2017 Hall Enterprises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var UserNameMainPage: UILabel!
    let userUsernameStored = UserDefaults.standard.string(forKey: "userUsername");
    var menuShowing = false;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.UserNameMainPage.text = userUsernameStored;
    }
    //Side bar moving in and out of view
    @IBAction func openMenu(_ sender: Any) {
        if(menuShowing){
            leadingConstraint.constant = -140;
        }
        else{
            leadingConstraint.constant = 0;
        }
        menuShowing = !menuShowing;
    }

   

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {


        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        if(!isUserLoggedIn){

        self.performSegue(withIdentifier: "loginView", sender: self)
        }


        
    }
        @IBAction func logoutButtonTapped(_ sender: Any) {
            UserDefaults.standard.set(false,forKey:"isUserLoggedIn");
            self.dismiss(animated: false,completion:nil);
            self.performSegue(withIdentifier: "loginView", sender: self)
    }
}

