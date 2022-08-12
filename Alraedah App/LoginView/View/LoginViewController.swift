// Created on 12/08/2022
// Copyright © 2022 Rizwan

import UIKit
import SDWebImage

class LoginViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        loadingIndicator.isHidden = true
        loadingIndicator.startAnimating()
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 8
        
        userName.delegate = self
        password.delegate = self
        
        image.sd_setImage(with: URL(string: "https://assets.alraedah.finance/sliders/SLYCCnkbsyoZL3q5oMkqjFgtK72WmUCc0up6Zazf.jpg"), completed: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        loadingIndicator.isHidden = true
        userName.text = ""
        password.text = ""
        
        userName.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        errorLabel.isHidden = true
        loadingIndicator.isHidden = false
        
        if let user = userName.text, let pass = password.text, !user.isEmpty, !pass.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.openScreen(user: user, pass: pass)
            })
            
        } else {
            loadingIndicator.isHidden = true
            errorLabel.text = "Please enter username and password"
            errorLabel.isHidden = false
        }
    }
    
    func openScreen(user: String, pass: String) {
        if user == "admin", pass == "admin" {
            openAdminScreen()
        } else if user == "user", pass == "user" {
            openCareerScreen()
        } else {
            loadingIndicator.isHidden = true
            errorLabel.text = "Username or Password is incorrect"
            errorLabel.isHidden = false
        }
    }
    
    func openAdminScreen() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "admin-page") as? AdminPageViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func openCareerScreen() {
        let storyBoard = UIStoryboard(name: "CareerPage", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "career-page") as? CareerPageViewController {
            viewController.isComingFromAdmin = false
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
