//
//  WeatherManager.swift
//  Clima
//
//  Created by user236150 on 8/3/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailedError(error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=f2b99ea6a1b23d2e81db65e2ae0f2cc6"
    
    var delegate : WeatherManagerDelegate?
    
    func fetachWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with : urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with : urlString)
    }
    
    func performRequest(with urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default) // what does default amount to
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
//                    print(error!)
                    self.delegate?.didFailedError(error: error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.performDecoding(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func performDecoding(_ weatherData: Data) -> WeatherModel? {
        let decode = JSONDecoder()
        do{
            let decodedData = try decode.decode(WeatherData.self, from: weatherData)
            
            let cityName = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            
            let weatherModel = WeatherModel(weatherId: id, temp: temp, cityName: cityName)
            
            return weatherModel
            
        }catch{
//            print(error)
            self.delegate?.didFailedError(error: error)
            return nil
        }
    }
    
    
}
