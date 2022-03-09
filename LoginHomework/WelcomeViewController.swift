//
//  WelcomeViewController.swift
//  LoginHomework
//
//  Created by MacBook on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var usernameText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextLabel.text = "Hoora your name is \(usernameText!)"
 
    }
    @IBAction func logoutButtonAction() {
        dismiss(animated: true)
    }
    

}
