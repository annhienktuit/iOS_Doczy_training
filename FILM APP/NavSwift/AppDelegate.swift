//
//  AppDelegate.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/3/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //let home = HomeVC(nibName: "HomeVC", bundle: nil)
        //let table = TableVC(nibName: "TableVC", bundle: nil)
        //let collection = CollectionVC(nibName: "CollectionVC", bundle: nil)
       // let result =  ShowResult(nibName: "ShowResult", bundle: nil)
        let tabbar = TabBarVC(nibName: "TabBarVC", bundle: nil)

        let nav = UINavigationController()
        nav.viewControllers = [tabbar]
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
        
        return true
        // Override point for customization after application launch.
        
        
    }

    // MARK: UISceneSession Lifecycle
/*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
*/

}

