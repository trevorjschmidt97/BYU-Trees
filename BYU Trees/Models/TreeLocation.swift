//
//  TreeLocation.swift
//  BYU Trees
//
//  Created by Trevor Schmidt on 10/6/21.
//

import Foundation

struct TreeLocation: Codable {
    var Latitude: String = ""
    var Longitude: String = ""
    var NorthDegrees: Int = 0
    var NorthMinutes: Int = 0
    var NorthSeconds: Double = 0.0
    var WestDegrees: Int = 0
    var WestMinutes: Int = 0
    var WestSeconds: Double = 0.0
    
    // no computed vars
    func toString() -> String {
        Latitude + Longitude + String(NorthDegrees) + String(NorthMinutes) + String(NorthSeconds) + String(WestDegrees) + String(WestMinutes) + String(WestSeconds)
    }
}
