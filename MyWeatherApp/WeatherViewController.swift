//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Pragun Sharma on 13/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

struct weatherDictArray {
    static var forecasts = [Forecast]()

}

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currWeatherObject = currentWeather()
    var foreCast = Forecast(weatherDict: Dictionary<String, AnyObject>())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: Notification.Name(rawValue: "load"), object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
            
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            currWeatherObject.downloadWeatherDetails {
                self.foreCast.downloadForeCastData {
                    self.updateMainUI()
                }
            }
            
        } else {
            
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDictArray.forecasts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherData", for: indexPath) as? WeatherCell {
            
            let forecast = weatherDictArray.forecasts[indexPath.row]
            cell.configureCell(foreCast: forecast)
            return cell
        }
        else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currWeatherObject.date
        currentTempLabel.text = "\(currWeatherObject.currentTemp)"
        currentWeatherLabel.text = currWeatherObject.weatherType
        locationLabel.text = currWeatherObject.cityName
        currentWeatherIcon.image = UIImage(named: currWeatherObject.weatherType)
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

