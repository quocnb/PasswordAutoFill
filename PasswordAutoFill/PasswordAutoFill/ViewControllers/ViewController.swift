//
//  ViewController.swift
//  PasswordAutoFill
//
//  Created by Quoc Nguyen on 12/27/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !LoginStatus.loggedIn {
            performSegue(withIdentifier: "ShowLogin", sender: self)
        }
    }

    @IBAction func loggedIn(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func logout(_ sender: Any) {
        LoginStatus.loggedIn = false
        performSegue(withIdentifier: "ShowLogin", sender: self)
    }
    
}

