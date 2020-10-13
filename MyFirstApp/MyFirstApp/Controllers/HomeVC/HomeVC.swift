//
//  HomeVC.swift
//  MyFirstApp
//	
//  Created by Vo Hoang Duc Khoa on 10/5/20.
//  Copyright © 2020 Vo Hoang Duc Khoa. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var lblHelloUser: UILabel!
    @IBOutlet weak var lblSearchEverything: UILabel!
    @IBOutlet weak var imgDoczy: UIImageView!
    
    
    @IBOutlet weak var weSupportCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var supportContents: [SupportContent] = []
    
    private let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        //topView.backgroundColor = .black
        return topView
    }()
    
    private let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .orange
        return bottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        
        //add views
        view.addSubview(topView)
        topView.addSubview(lblHelloUser)
        topView.addSubview(lblSearchEverything)
        topView.addSubview(imgDoczy)
        topView.addSubview(searchBar)
        
        view.addSubview(bottomView)
        bottomView.addSubview(weSupportCollectionView)
        
        addConstraints()
        
        searchBar.becomeFirstResponder()
        supportContents = fetchDataSupport()
        
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    //config collection view
    func configureCollectionView(){
        //register collection cell
        weSupportCollectionView.register(UINib(nibName: "SupportCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        //register collection header
        let headerNib = UINib(nibName: "WeSupportHeader", bundle: nil)
        weSupportCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        //set collection view delegates
        weSupportCollectionView.delegate = self
        weSupportCollectionView.dataSource = self
    }
    
    func configureSearchBar(){
        searchBar.layer.borderWidth = 0
        searchBar.clearBackgroundColor()
    }
    
}



//MARK: - Extensions
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


    //cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        supportContents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weSupportCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SupportCollectionCell
        cell.updateData(data: supportContents[indexPath.row])
        return cell
    }
    
     
    //layout
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 70
        return CGSize(width: screenWidth/2, height: (screenWidth/2) * 5/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

 
    //header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
               let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! WeSupportHeader
	
               reusableview.frame = CGRect(x: 0 , y: 0, width: self.view.frame.size.width, height: 50)
               reusableview.lblWeSupport.frame = reusableview.frame
               reusableview.lblWeSupport.text! = "WE SUPPORT"
                return reusableview
        default:
            fatalError("Unexpected element kind")
        }
    }
}

extension HomeVC{
    func fetchDataSupport() -> [SupportContent]{
        let content1 = SupportContent(title: "Mathematics", image: Images.mathematics)
        let content2 = SupportContent(title: "Science & Technology", image: Images.scienceTechnology)
        let content3 = SupportContent(title: "Society & Culture", image: Images.societyCulture)
        let content4 = SupportContent(title: "Everyday life", image: Images.everydayLife)
        return [content1, content2, content3, content4]
    }
    
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //add
        constraints.append(topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(topView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1.1/5))
        
        constraints.append(lblHelloUser.leadingAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(lblHelloUser.heightAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.heightAnchor, multiplier: 2/3, constant: -10))
        
        constraints.append(lblSearchEverything.leadingAnchor.constraint(equalTo: lblHelloUser.leadingAnchor))
        constraints.append(lblSearchEverything.heightAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.heightAnchor, multiplier: 2/3, constant: 35))
        
        constraints.append(imgDoczy.trailingAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(imgDoczy.heightAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.heightAnchor, multiplier: 2/3))

        constraints.append(searchBar.leadingAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(searchBar.trailingAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(searchBar.bottomAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(bottomView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 3.9/5))
        
        constraints.append(weSupportCollectionView.leadingAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.leadingAnchor, constant: 30))
        constraints.append(weSupportCollectionView.trailingAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.trailingAnchor, constant: 30))
        constraints.append(weSupportCollectionView.topAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.topAnchor, constant: 80))
        constraints.append(weSupportCollectionView.bottomAnchor.constraint(equalTo: bottomView.safeAreaLayoutGuide.bottomAnchor))
        //active
        NSLayoutConstraint.activate(constraints)
    }
}
