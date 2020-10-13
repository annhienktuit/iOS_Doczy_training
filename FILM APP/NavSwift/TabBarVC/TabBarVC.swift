//
//  TabBarVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/6/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DOCZY FILM APP"
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        let firstViewController = MainVC()
       
        //firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recent imageLiteral(resourceName: "house-black-silhouette-without-door.png")s, tag: 0)
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), tag: 0) //icon size 29
        let secondViewController = SearchVC()

        //secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        secondViewController.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "search"), tag: 1)
        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList
        // Do any additional setup after loading the view.
       
    }
    override func viewDidDisappear(_ animated: Bool){
           self.navigationController?.isNavigationBarHidden = true
       }
       override func viewDidAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
       }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
