//
//  ImageViewController.swift
//  LoginHomework
//
//  Created by MacBook on 15.03.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 0.9
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage (named: user.person.image)
    }
    
}
