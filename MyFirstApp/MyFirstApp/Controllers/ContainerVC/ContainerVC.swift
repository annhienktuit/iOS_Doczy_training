//
//  ContainerVC.swift
//  MyFirstApp
//
//  Created by Vo Hoang Duc Khoa on 10/7/20.
//  Copyright © 2020 Vo Hoang Duc Khoa. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    let tabBarVC = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()

        // Do any additional setup after loading the view.
    }

    func configureTabBar(){
        let homevc = HomeVC()
        
        let homeTabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        homevc.tabBarItem = homeTabBarItem
        
        tabBarVC.viewControllers = [homevc]
        self.view.addSubview(tabBarVC.view)
    }

}
