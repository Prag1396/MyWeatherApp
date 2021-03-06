//
//  Constants.swift
//  MyWeatherApp
//
//  Created by Pragun Sharma on 14/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "fccddbd6b420c8f6f197af91480c6bc9"

typealias downLoadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=fccddbd6b420c8f6f197af91480c6bc9"


let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=fccddbd6b420c8f6f197af91480c6bc9"
