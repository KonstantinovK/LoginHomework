//
//  UserInfoViewController.swift
//  LoginHomework
//
//  Created by MacBook on 15.03.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var userInfo: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
        
        userInfo.text = " \(user.person.fullName) hobby: \(user.person.hobby), work as: \(user.person.work)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
    
}
