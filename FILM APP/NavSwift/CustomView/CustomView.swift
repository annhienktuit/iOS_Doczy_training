//
//  CustomView.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/9/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import UIKit
import Alamofire


struct Data {
    var title: String
    var image: UIImage
    var description: String
    }
    //@IBOutlet weak var lblMain: UILabel!



class CustomView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var contentView: UIView!
    var film_array = [Film]()
    let arrImage:[Data] = [Data(title: "COCO part 1", image: #imageLiteral(resourceName: "img2"), description: "PHIM COCO 1"),
    Data(title: "COCO part 2", image: #imageLiteral(resourceName: "img1"), description: "PHIM COCO2"),
    Data(title: "Ròm", image: #imageLiteral(resourceName: "img3"), description: "PHIM ROM"),
    Data(title: "Death on the Nile", image: #imageLiteral(resourceName: "img4"), description:  "PHIM DEATH ON THE NILE")]
    var actionClickOn:(([Film])->())?
    
    var actionClicked:((Film)->())?
    //
    
    func updateData(films: [Film]) {
        film_array = films
        collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            let bundle = Bundle(for: type(of: self))
            bundle.loadNibNamed("CustomView", owner: self, options: nil)
            addSubview(contentView)
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            initCollectionView()
        }
        
        
        
        private func initCollectionView() {
            //let nib = UINib(nibName: "CollectionCustomCell", bundle: nil)
            //collectionView.register(nib, forCellWithReuseIdentifier: "CustomCollectionCell")
            collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCollectionCell")
            collectionView.dataSource = self
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.collectionViewLayout = layout
            
            
            //constraints
            
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300).isActive = true
            collectionView.backgroundColor = .white
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
            collectionView.backgroundColor = .white
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
            collectionView.backgroundColor = .white
            // collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
            collectionView.delegate = self
           
        }
    }

    extension CustomView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            actionClickOn?(film_array)
            let film = Film()
            film.titleOriginal = film_array[indexPath.row].titleOriginal
            film.logo = film_array[indexPath.row].logo
            film.overview = film_array[indexPath.row].overview
            actionClicked?(film)
            
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            actionClickOn?(film_array)
            return film_array.count 
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/3.7, height: collectionView.frame.width/2.3)
           }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionCell", for: indexPath) as? CustomCell else {
                fatalError("can't dequeue CustomCell")
            }
            //add shadow
            actionClickOn?(film_array)
            //cell.data = self.arrImage[0]
            cell.data = self.film_array[indexPath.row]
            cell.layer.cornerRadius = collectionView.frame.height/2
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false //<-
            return cell
        }
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

        class CustomCell: UICollectionViewCell {
            var data:Film? {
                didSet {
                    guard let data =  data else {return}
                    bg.image = data.logo
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
}
