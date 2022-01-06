//
//  LocationModel.swift
//  Africa
//
//  Created by Mixko on 6/1/2565 BE.
//

import Foundation
import CoreLocation

struct NationalParkLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    //Computed property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
