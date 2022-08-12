// Created on 12/08/2022
// Copyright © 2022 Rizwan

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var okayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.masksToBounds = true
        popUpView.layer.borderWidth = 1
        popUpView.layer.borderColor = UIColor.black.cgColor
        popUpView.layer.cornerRadius = 8
        
        okayButton.layer.masksToBounds = true
        okayButton.layer.cornerRadius = 10
    }
    
    @IBAction func okayTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
