//
//  WatherViewModel.swift
//  WatherApp
//
//  Created by Olya Levandivska on 21.05.2023.
//

import Foundation
import Combine
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject {
    
    @Published var weathers: [WeatherGeneralData] = []
    @Published var currentLocation = ""
    @Published var showError = false
    @Published var loader: Bool
    @Published var successActionAlerrt = false

    let locationManager = CLLocationManager()
    let weatherService = WeatherService()
    var error = ""
    
    override init(){
        self.loader = true
        super.init()
        locationManager.delegate = self
        locationManager.requestLocation()
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func fetchWeather(lat: String, lon: String){
        weatherService.fetchWeather(lat: lat, lon: lon, completion: { res in
            switch res {
            case .success(let weathers):
                DispatchQueue.main.async { [weak self] in
                    self?.loader = false
                    self?.weathers = weathers
                    self?.successActionAlerrt = true
                }
            case .failure(let error):
                self.loader = false
                self.error = "Error during fetching weathers"
                self.showError = true
                print("Request failed with error: \(error)")
            }
        })
        
    }
    
    func updateWeather(address: String){
        self.loader = true
        self.currentLocation = address
        self.weathers = []

        getCoordinate(addressString: address, completionHandler: { [weak self] coord, error in
            if error == nil{
                self?.fetchWeather(lat: String(coord.latitude), lon: String(coord.longitude))
            } else {
                self?.error = "Wrong Address"
                self?.showError = true
                self?.loader = false
            }
        })
    }
    
    
    private func getCoordinate(addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    
    private func fetchCityAndCountry(from location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if error == nil{
                self.currentLocation = "\(placemarks?.first?.locality ?? "") , \(placemarks?.first?.country ?? "")"
            }
        }
    }
}

extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        self.showError = false
        locationManager.requestLocation()
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            fetchCityAndCountry(from: location)
            fetchWeather(lat: String(latitude), lon: String(longitude))
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        self.loader = false
        self.showError = true
        self.error = "Error, Can't fetch your location to show weather in your city"
    }
    
}

