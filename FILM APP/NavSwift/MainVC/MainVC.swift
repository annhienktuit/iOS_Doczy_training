//
//  MainVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/6/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_main"))
        lblTitle.textColor = .brown
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
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
