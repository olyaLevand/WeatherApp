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
    var weather: [WeatherWeatherData]
    var visibility: Int
}

struct WeatherMainData: Codable, Hashable{
    var temp: Double
    var feelsLike: Double
    var humidity: Int
    var pressure: Int
    var seaLevel: Int
    
    private enum CodingKeys : String, CodingKey {
        case temp, humidity, pressure, feelsLike = "feels_like", seaLevel = "sea_level"
    }
}

struct WeatherGeneralData: Codable, Hashable{
    var dateStr: String
    var averageTemp: Int
    var items: [WeatherItem]
}

struct WeatherWeatherData: Codable, Hashable{
    var description: String
}
