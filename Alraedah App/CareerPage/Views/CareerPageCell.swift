// Created on 11/08/2022
// Copyright © 2022 Talabat

import Foundation
import UIKit

class CareerPageCell: UICollectionViewCell {
    
    @IBOutlet weak var skillLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(skill: String) {
        skillLabel.text = skill
    }
}
