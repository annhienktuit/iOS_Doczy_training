//
//  DetailVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/15/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

   
    @IBOutlet weak var imgBackBtn: UIImageView!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    var film : Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgBackBtn.image = UIImage(named: "back")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgBackBtn.isUserInteractionEnabled = true
        imgBackBtn.addGestureRecognizer(tapGestureRecognizer)
        lblTitle.text = film.titleOriginal
        lblTitle.adjustsFontSizeToFitWidth = true
        imgPoster.image = film.logo
        lblDescription.text = film.overview
        lblDescription.numberOfLines = 7
        imgPoster.layer.cornerRadius = 20
        imgPoster.layer.borderWidth = 10
        imgPoster.layer.borderColor = UIColor.clear.cgColor
        imgPoster.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let tabbarvc = TabBarVC(nibName: "TabbarVC", bundle: nil)
        self.navigationController?.pushViewController(tabbarvc, animated: true)
        
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
