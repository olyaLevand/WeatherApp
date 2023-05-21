//
//  WeatherService.swift
//  WatherApp
//
//  Created by Olya Levandivska on 17.05.2023.
//

import Foundation
import Alamofire


class WeatherService {
    
    let api = "9a62a33ae6faa42ac0bc488c79b363ae"
    let units = "metric"

    private func getUrl(lat: String, lon: String) -> String {
        return "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(api)&units=\(units)"
    }

    func fetchWeather(lat: String, lon: String, completion: @escaping (Result<[WeatherItem], Error>) -> Void) {
        guard let url = URL(string: getUrl(lat: lat, lon: lon)) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.missingData))
                return
            }
            
            print("data: \(String(data: data, encoding: .utf8))")
            
            do {
                // Parse the JSON data
                let res = try JSONDecoder().decode(WeatherResponse.self, from: data)
                if 200..<300 ~= Int(res.cod)!{
                    completion(.success(res.list))
                }else {
                    completion(.failure(NetworkError.UnknownError))
                }
   
            } catch (let error){
                completion(.failure(error))
            }
            
        }.resume()
    }
}

