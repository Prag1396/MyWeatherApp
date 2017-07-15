//
//  WeatherCell.swift
//  MyWeatherApp
//
//  Created by Pragun Sharma on 14/07/17.
//  Copyright © 2017 Pragun Sharma. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell(foreCast: Forecast) {
        lowTemp.text = "\(foreCast.lowTemp)"
        highTemp.text = "\(foreCast.highTemp)"
        weatherType.text = foreCast.weatherType
        weatherIcon.image = UIImage(named: foreCast.weatherType)
        dayLabel.text = foreCast.date
    }
    


}
