//
//  TreePest.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/6/21.
//

import Foundation

struct TreePest: Codable, Identifiable {
    var ID: Int = 0
    var CommonName: String = ""
    var OtherInfo: String = ""
    var Prevention: String = ""
    var ScientificName: String = ""
    var Treatment: String = ""
    
    // Computed Vars
    var id: Int {
        self.ID
    }
}
