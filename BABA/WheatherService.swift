//
//  WeatherService.swift
//  BABA
//
//  Created by Guihal Gwenn on 16/02/17.
//  Copyright © 2017 Guihal Gwenn. All rights reserved.
//

import Alamofire
import UIKit

class WeatherService: NSObject {
    
    enum WheatherError : Error {
        case unknowError
        case networkError
    }
    
    enum WeatherResponse {
        case success(WeatherModel)
        case error(WheatherError)
    }

    func get16DaysWeather(completion: @escaping (WeatherResponse) -> Void) {
        
        let url = "https://samples.openweathermap.org/data/2.5/forecast/daily?id=6455259&appid=b1b15e88fa797225412429c1c50c122a1"
        
        Alamofire.request(url).responseJSON { response in
            
            switch (response.result) {
            case .success(let data):
                if let dictionary = data as? [String:Any], let weatherModel = WeatherModel(json: dictionary) {
                    completion( .success(weatherModel) )
                } else {
                    completion( .error( .unknowError ) )
                }
                
            case .failure( _):
                completion( .error( .networkError ) )
            }
        }
    }
}
