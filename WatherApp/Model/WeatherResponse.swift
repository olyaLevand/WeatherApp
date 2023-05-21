//
//  WatherResponce.swift
//  WatherApp
//
//  Created by Olya Levandivska on 21.05.2023.
//

import Foundation

struct WeatherResponse: Codable{
    var cod: String
    var list: [WeatherItem]
}

struct WeatherItem: Codable, Hashable{
    var main: WeatherMainData
    var dt: Date
}

struct WeatherMainData: Codable, Hashable{
    var temp: Double
    var feelsLike: Double
    var humidity: Int
    
    private enum CodingKeys : String, CodingKey {
        case temp, humidity
        case feelsLike = "feels_like"
    }
}
