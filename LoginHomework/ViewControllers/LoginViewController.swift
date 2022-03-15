//
//  ViewController.swift
//  LoginHomework
//
//  Created by MacBook on 09.03.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var backgroundViewMain: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Private properties
    private let user = User.getUserData()
   
    
    //MARK: -Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
       
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.user = user
            }
        }
    }
    
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
        usernameTextField.returnKeyType = .next
        passwordTextField.backgroundColor = .white
        passwordTextField.returnKeyType = .done
        loginButton.backgroundColor = .gray
        loginButton.layer.cornerRadius = 10
        
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
   
    }
    
    
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: -IBActions
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
        showAlert(title: "Ooops!", message: "Your password is \(user.password) 🙄")
    }
    
    @IBAction func forgetUsernameAction(_ sender: Any) {
        showAlert(title: "Ooops!", message: "Your username is \(user.login) 🙄")
    }
    
    @IBAction func loginButtonPressed() {
        guard usernameTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
}
//MARK: -Alert Controller
extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - Keyboard

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}
