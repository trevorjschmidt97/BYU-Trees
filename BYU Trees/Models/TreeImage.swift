//
//  TreeImage.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/6/21.
//

import Foundation

struct TreeImage: Codable, Hashable {
    var Caption: String = ""
    var ImageType: Int = 0
    var PhotoCredit: String = ""
    var ThumbnailURL: String = ""
    var URL: String = ""
    
    // no computed vars
}
