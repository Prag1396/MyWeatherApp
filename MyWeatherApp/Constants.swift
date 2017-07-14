//
//  Constants.swift
//  MyWeatherApp
//
//  Created by Pragun Sharma on 14/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "fccddbd6b420c8f6f197af91480c6bc9"

typealias downLoadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"