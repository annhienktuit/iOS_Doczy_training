//
//  CollectionVC.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/4/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit
/*

class CollectionVC: UIViewController {
    //@IBOutlet weak var viewTest: UIView!
    
    @IBOutlet weak var lblTrending: UILabel!
    let arrImage:[Data] = [Data(title: "Film1", image: #imageLiteral(resourceName: "img2")),
                                 Data(title: "Film2", image: #imageLiteral(resourceName: "img1")),
                                 Data(title: "Film3", image: #imageLiteral(resourceName: "img3")),
                                 Data(title: "Film4", image: #imageLiteral(resourceName: "img4"))]

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_main"))
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        collectionView.backgroundColor = .white
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        collectionView.backgroundColor = .white
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        collectionView.backgroundColor = .white
       // collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }


    
}
extension CollectionVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        cell.data = self.arrImage[indexPath.row]
        return cell
    }
    
    
}

class CustomCell: UICollectionViewCell {
    var data:Data? {
        didSet {
            guard let data =  data else {return}
            bg.image = data.image
        }
    }
    fileprivate let bg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        //bg.layer.cornerRadius = 20
        //bg.layer.borderColor = UIColor.clear.cgColor
        
         bg.layer.cornerRadius = 20
         bg.layer.borderWidth = 10
         bg.layer.borderColor = UIColor.clear.cgColor
         bg.layer.masksToBounds = true
/*
         bg.layer.shadowColor = UIColor.black.cgColor
         bg.layer.shadowOffset = CGSize(width: 0, height: 2.0)
         bg.layer.shadowRadius = 20
         bg.layer.shadowOpacity = 0.5
         bg.layer.masksToBounds = false
         bg.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

*/
