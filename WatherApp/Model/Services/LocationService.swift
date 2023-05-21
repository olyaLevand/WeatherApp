//
//  LocationService.swift
//  WatherApp
//
//  Created by Olya Levandivska on 20.05.2023.
//

import Foundation
import CoreLocation


//let address = "Rio de Janeiro, Brazil"
//
//getCoordinateFrom(address: address) { coordinate, error in
//    guard let coordinate = coordinate, error == nil else { return }
//    // don't forget to update the UI from the main thread
//    DispatchQueue.main.async {
//        print(address, "Location:", coordinate) // Rio de Janeiro, Brazil Location: CLLocationCoordinate2D(latitude: -22.9108638, longitude: -43.2045436)
//    }
//
//}

func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
}
