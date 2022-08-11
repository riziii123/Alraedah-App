// Created on 12/08/2022
// Copyright © 2022 Rizwan

import Foundation
import UIKit

class FilterPageViewController: UIViewController {
    
    var addSkillsDelegate: FilterToAddSkillsPageContract?
    var isSkillSelected: Bool = false
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var applyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyButton.layer.cornerRadius = 10
        applyButton.layer.borderWidth = 1
        applyButton.layer.borderColor = UIColor.black.cgColor
        
        switchButton.setOn(isSkillSelected, animated: true)
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        // Do nothing
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        addSkillsDelegate?.filterApplyTapped(valueSelected: switchButton.isOn)
        self.dismiss(animated: true, completion: nil)
    }
    
}
