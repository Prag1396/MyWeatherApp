//
//  Location.swift
//  MyWeatherApp
//
//  Created by Pragun Sharma on 17/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import Foundation

class Location {
    
    static var  sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
