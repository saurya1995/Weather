//
//  City.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import Foundation

struct City : Identifiable{
    
    let id = UUID()
    let name: String
    let lat: Double
    let long: Double
    
    
    static var placeHolder:[City]{
        [
            City(name: "New York", lat: 0.0, long: 0.0),
            City(name: "Munich", lat: 0.4, long: 0.2),
            City(name: "Berlin", lat: 0.7, long: 0.9),
        ]
    }
}
