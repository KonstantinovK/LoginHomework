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
    
    var user: User!
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondColor)
        usernameTextLabel.text = "Welcome, \(user.person.fullName)!"
        logoutButton.layer.cornerRadius = 10
    }
    
    @IBAction func logoutButtonAction() {
        dismiss(animated: true)
    }
}

extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
