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
            City(name: "New York", lat: 30, lon: 30),
            //City(name: "Munich", lat: 0.4, lon: 0.2),
           // City(name: "Berlin", lat: 0.7, lon: 0.9),
        ]
    }
}
