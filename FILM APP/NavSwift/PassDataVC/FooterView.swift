//
//  FooterView.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/5/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//
/*
import UIKit

class FooterView: UIView {

    var action:((String)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCommon()
    }

    private func initCommon() {
        let view = loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }

    private func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FooterView", bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    @IBAction func maleClicked(_ sender: Any) {
        action?("Male")
        
    }
    
    @IBAction func femaleClicked(_ sender: Any) {
        action?("Female")
    }
    
    
    
   
}
*/
