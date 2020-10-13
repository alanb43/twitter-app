//
//  LoginViewController.swift
//  Twitter
//
//  Created by Alan Bergsneider on 10/12/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // If user was known to have logged in,
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            // send the sender to their home screen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        // Twitter API Login authentication link
        let loginUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: loginUrl, success: {
            // creates true indicating that a user is logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            // code we do if we successfully log in
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            // what we do if we don't log in
            print("Could not log in!")
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
