//
//  SideMenuViewController.swift
//  SideMenuNavigationWithTabBar
//
//  Created by Jay Prakash Sharma on 01/10/22.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    
    @IBOutlet var sideMenuTableView: UITableView!
    @IBOutlet var headerImage:UIImageView!
    @IBOutlet var name:UILabel!
    @IBOutlet var country:UILabel!
    @IBOutlet var email:UILabel!
    
    var delegate: SideMenuViewControllerDelegate?
    var defaultHighlightedCell: Int = 0
    var menu: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(systemName: "star")!, title: "Menu 1"),
        SideMenuModel(icon: UIImage(systemName: "brain.head.profile")!, title: "Menu 2"),
        SideMenuModel(icon: UIImage(systemName: "star")!, title: "Menu 3"),
        SideMenuModel(icon: UIImage(systemName: "star")!, title: "Menu 4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.backgroundColor = .gray
        self.sideMenuTableView.separatorStyle = .singleLine
        self.sideMenuTableView.separatorColor = UIColor.white
        self.sideMenuTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        // Clipping profile image view to circle
        headerImage.layer.borderWidth = 2
        headerImage.layer.borderColor = UIColor.white.cgColor
        headerImage.layer.cornerRadius = headerImage.frame.height/2
        headerImage.clipsToBounds = true
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
        // Update TableView with the data
        self.sideMenuTableView.reloadData()
        name.text = "Jay"
        country.text = "India"
        email.text = "jayprakashsharma7@outlook.com"
        headerImage.image = UIImage(systemName: "brain.head.profile")
        headerImage.backgroundColor = UIColor.lightGray
        headerImage.tintColor = UIColor.black
    }
}

// MARK: - UITableViewDelegate
extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

// MARK: - UITableViewDataSource
extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }
        cell.iconImageView.image = self.menu[indexPath.row].icon
        cell.titleLabel.text = self.menu[indexPath.row].title
        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
