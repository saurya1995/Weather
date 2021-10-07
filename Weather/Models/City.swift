//
//  City.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import Foundation

struct City : Codable, Identifiable{
    
    let id = UUID()
    
    let name: String
    let lat: Double
    let lon: Double
    
    
    static var placeholder:[City]{
        [
            //City(name: "New York", lat: 30, lon: 30),
            City(name: "Berlin", lat: 43.968, lon: -88.9435),
        ]
    }
}
