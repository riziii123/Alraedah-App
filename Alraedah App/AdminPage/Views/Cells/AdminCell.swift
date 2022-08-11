// Created on 09/08/2022
// Copyright © 2022 Rizwan

import Foundation
import UIKit
import SDWebImage

class AdminCell: UITableViewCell {
    
    var delegate: AdminPanelCellToViewControllerProtocol?
    var index: Int?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var dateAppliedLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(application: ApplicationModel, index: Int) {
        self.index = index
        
        nameLabel.text = "\(application.firstName) \(application.lastName)"
        occupationLabel.text = application.occupation
        dateAppliedLabel.text = application.dateApplied
        statusLabel.text = application.status
        
        userImage.sd_setImage(with: URL(string: application.imageUrl), completed: nil)
    }
    
    @IBAction func changeStatusTapped(_ sender: Any) {
        if let index = self.index {
            delegate?.updateStatusTapped(index: index)
        }
    }
    
    @IBAction func editTapped(_ sender: Any) {
        if let index = self.index {
            delegate?.editTapped(index: index)
        }
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if let index = self.index {
            delegate?.deleteTapped(index: index)
        }
    }
}
