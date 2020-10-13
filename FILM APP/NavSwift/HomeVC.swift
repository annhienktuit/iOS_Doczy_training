//
//  HomeVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/3/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//
/*
import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var btnCollection: UIButton!
    @IBOutlet weak var btnTable: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var passdata: FooterView!
    var collectionView = CollectionVC(nibName: "CollectionVC", bundle: nil)
    var showresult = ShowResult(nibName: "ShowResult", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        passdata.action = {ketqua in
            self.lblResult.text = "Your gender is: \(ketqua)"
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func openNewScreen(btn: UIButton) {
        //navigationController?.pushViewController(viewController: calculator, animated: true)
        var vc:UIViewController?
        let screenName:String = btn.titleLabel?.text ?? "label"
        switch screenName {
        case "TableView":
            vc = TableVC(nibName: "TableVC", bundle: nil)
            debugPrint(screenName)
        case "CollectionVC":
            vc = CollectionVC(nibName: "CollectionVC", bundle: nil)
            debugPrint(screenName)
        case "ShowResult":
            vc = ShowResult(nibName: "ShowReult", bundle: nil)
        default:
            vc = nil
        }
        debugPrint(screenName)
        if vc != nil {
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    @IBAction func btnCollection(_ sender: Any) {
        navigationController?.pushViewController(collectionView, animated: true)
    }
    //present
    @IBAction func presentClicked(_ sender: UIButton) {
        let collection = CollectionVC(nibName: "CollectionVC", bundle: nil)
        present(collection, animated: true, completion: nil)
    }
   
    @IBAction func resultClicked(_ sender: Any) {
        navigationController?.pushViewController(showresult, animated: true)
    }
    
    


    
    
    
}
*/
