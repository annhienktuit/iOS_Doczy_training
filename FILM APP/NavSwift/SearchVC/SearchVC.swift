//
//  SearchVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/6/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    let detailview = DetailVC(nibName: "DetailVC", bundle: nil)
    @IBAction func btnclick(_ sender: Any) {
        navigationController?.pushViewController(detailview, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_search"))
        self.navigationController?.isNavigationBarHidden = false
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search"
        searchBar.isTranslucent = true
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        self.tabBarController?.navigationItem.titleView = searchBar
        
        // Do any additional setup after loading the view.
    
    }
    override func viewDidDisappear(_ animated: Bool){
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
      self.navigationController?.isNavigationBarHidden = false
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
