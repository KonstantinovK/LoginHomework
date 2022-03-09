//
//  ViewController.swift
//  LoginHomework
//
//  Created by MacBook on 09.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backgroundViewMain: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.8]
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.backgroundColor = .white
        usernameTextField.delegate = self
        usernameTextField.returnKeyType = .next
        passwordTextField.backgroundColor = .white
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        loginButton.backgroundColor = .gray
        loginButton.layer.cornerRadius = 10
        
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loginVC = segue.destination as? WelcomeViewController else { return }
        loginVC.usernameText = usernameTextField.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
        let alertPassword = UIAlertController(title: "Ooops!", message: "Your password is pass", preferredStyle: UIAlertController.Style.alert)
        alertPassword.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
        }))
        
        self.present(alertPassword, animated: true, completion: nil)
    }
    
    @IBAction func forgetUsernameAction(_ sender: Any) {
        let alertUser = UIAlertController(title: "Ooops!", message: "Your name is user", preferredStyle: UIAlertController.Style.alert)
        alertUser.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
        }))
        
        self.present(alertUser, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonAction() {
        if usernameTextField.text == "user" && passwordTextField.text == "pass" {
            return
        } else {
            let alertLogin = UIAlertController(title: "Ooops!", message: "Something wrong with name or password", preferredStyle: UIAlertController.Style.alert)
            alertLogin.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            }))
            
            self.present(alertLogin, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        return true
    }
    
     
}


