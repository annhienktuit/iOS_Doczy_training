//
//  Film.swift
//  NavSwift
//
//  Created by Nguyen Huu An Nhien on 10/15/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import Foundation
import UIKit
class Film {
    var titleOriginal: String = "Title"
    var name: String = "default name"
    var logo: UIImage = UIImage(named: "logo")!
    var poster_path: String = "https://"
    var overview: String = "This is description"
    func parserData(data: [String : Any]) {
       name = data["original_title"] as? String ?? ""
    }
    
    
}

