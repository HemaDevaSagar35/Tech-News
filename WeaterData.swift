//
//  WeaterData.swift
//  Clima
//
//  Created by user236150 on 8/4/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
}

