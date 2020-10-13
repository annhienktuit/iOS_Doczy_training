//
//  SupportCollectionCell.swift
//  MyFirstApp
//
//  Created by Vo Hoang Duc Khoa on 10/7/20.
//  Copyright © 2020 Vo Hoang Duc Khoa. All rights reserved.
//
import Foundation
import UIKit
/*
class SupportCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var titleContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateData(data: SupportContent){
        titleContent.text = data.title ?? "defaultName"
        imageContent.image = data.image ?? UIImage()
    }
}
*/
class SupportCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var titleContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(imageContent)
        contentView.addSubview(titleContent)
        configureCell()
    }
    
    func updateData(data: SupportContent){
        titleContent.text = data.title
        print(data.title!)
        imageContent.image = data.image
    }
    
    func configureCell(){
        imageContent.translatesAutoresizingMaskIntoConstraints = false
        imageContent.contentMode = .scaleAspectFit
        imageContent.clipsToBounds = true
        imageContent.layer.borderWidth = 1
        imageContent.layer.cornerRadius = 30
        
        addConstraints()
    }
    
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(imageContent.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0))
        constraints.append(imageContent.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(imageContent.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(imageContent.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        
        constraints.append(titleContent.topAnchor.constraint(equalTo: imageContent.bottomAnchor))
        constraints.append(titleContent.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(titleContent.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(titleContent.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor))
        
        
        //active
        NSLayoutConstraint.activate(constraints)
    }
}

