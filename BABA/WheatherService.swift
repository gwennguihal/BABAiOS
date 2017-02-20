//
//  WeatherService.swift
//  BABA
//
//  Created by Guihal Gwenn on 16/02/17.
//  Copyright © 2017 Guihal Gwenn. All rights reserved.
//

import Alamofire
import UIKit

protocol WeatherServiceDelegate : class {
    func datasFetched(response:WeatherService.WeatherResponse)
}

class WeatherService: NSObject {
    
    enum WheatherError : Error {
        case unknowError
        case networkError
    }
    
    enum WeatherResponse {
        case success(WeatherModel)
        case error(WheatherError)
    }
    
    weak var delegate:WeatherServiceDelegate?

    func get16DaysWeather() {
        
        let url = "https://samples.openweathermap.org/data/2.5/forecast/daily?id=6455259&appid=b1b15e88fa797225412429c1c50c122a1"
        
        Alamofire.request(url).responseJSON { [weak self] response in
            
            switch (response.result) {
            case .success(let data):
                if let dictionary = data as? [String:Any], let weatherModel = WeatherModel(json: dictionary) {
                    self?.delegate?.datasFetched(response: .success(weatherModel) )
                } else {
                    self?.delegate?.datasFetched(response: .error( .unknowError ) )
                }
                
            case .failure( _):
                self?.delegate?.datasFetched(response: .error( .networkError ) )
            }
        }
    }
}
