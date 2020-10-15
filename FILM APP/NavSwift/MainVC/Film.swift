//
//  Film.swift
//  NavSwift
//
//  Created by Paul Nguyen on 10/15/20.
//  Copyright © 2020 Nguyen Huu An Nhien. All rights reserved.
//

import Foundation
class Film {
    var titleOriginal: String = ""
    func parserData(data: [String : Any]) {
        titleOriginal = data["original_title"] as? String ?? ""
    }
}
