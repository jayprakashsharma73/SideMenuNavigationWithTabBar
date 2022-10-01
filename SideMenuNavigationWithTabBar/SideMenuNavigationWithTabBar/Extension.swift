//
//  Extension.swift
//  SideMenuNavigationWithTabBar
//
//  Created by Jay Prakash Sharma on 01/10/22.
//

import UIKit

extension UIViewController{
    
    func navigationBar(_ title: String){
        navigationController?.navigationBar.isHidden = false
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        let hamburgurIcon = UIButton(type: .system)
        hamburgurIcon.setImage(UIImage(named: "hamburgur"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hamburgurIcon)
        hamburgurIcon.addTarget(.none, action: #selector(revealViewController()?.revealSideMenu), for: .allEvents)
        self.title = title
    }
}

