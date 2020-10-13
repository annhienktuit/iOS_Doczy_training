//
//  TabBarVC.swift
//  MyFirstApp
//
//  Created by Vo Hoang Duc Khoa on 10/7/20.
//  Copyright © 2020 Vo Hoang Duc Khoa. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        // Do any additional setup after loading the view.
    }
    
    func configureTabBar(){
        let homeView    = HomeVC(nibName: "HomeVC", bundle: nil)
        let tableView   = HomeVC(nibName: "HomeVC", bundle: nil)
        
        let homeTabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let tableTabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        homeView.tabBarItem = homeTabBarItem
        tableView.tabBarItem = tableTabBarItem
        
        self.viewControllers = [homeView, tableView]
    }
    
}
