//
//  SideMenuCell.swift
//  SideMenuNavigationWithTabBar
//
//  Created by Jay Prakash Sharma on 01/10/22.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Background
        self.backgroundColor = .clear
        // Icon
        self.iconImageView.tintColor = .black
        // Title
        self.titleLabel.textColor = .white
    }
}
