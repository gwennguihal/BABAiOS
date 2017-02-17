//
//  WeatherCellAdapter.swift
//  BABA
//
//  Created by Guihal Gwenn on 17/02/17.
//  Copyright © 2017 Guihal Gwenn. All rights reserved.
//

import Foundation

struct WeatherCellAdapter {
    
    let iconURL:URL?
    let temperature:String
    let date:String
    
    static let dateFormatter:DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "EEEE d MMMM"
        return df
    }()
    
    init(weatherDay:WeatherDay) {
        
        iconURL = URL(string: "https://openweathermap.org/img/w/" + weatherDay.weatherIcon + ".png")
        temperature = "\(weatherDay.temperature)°"
        date = WeatherCellAdapter.dateFormatter.string(from: weatherDay.date)
        
    }
}
