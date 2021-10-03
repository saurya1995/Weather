//
//  Data.swift
//  Weather
//
//  Created by Saurya on 03.10.21.
//

import Foundation

struct Data: Codable {
    /*  struct Current: Codable {
        struct Weather: Codable {
            let id:Int
            let main:String
            let description:String
            let item:String
        }
        let dt: Date
        let sunrise, sunset: Date?
        let temp, feelsLike: Double
        let pressure, humidity: Int
        let dewPoint, uvi: Double
        let clouds, visibility: Int
        let windSpeed: Double
        let windDeg: Int
        let windGust: Double
        let weather: [Weather]
        
        enum CodingKeys: String, CodingKey {
            case dt, sunrise, sunset, temp
            case feelsLike = "feels_like"
            case pressure, humidity
            case dewPoint = "dew_point"
            case uvi, clouds, visibility
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case windGust = "wind_gust"
            case weather, pop, rain
        }
    }
        struct Minutely: Codable {
            let dt, precipitation: Int
        }
        
        struct Hourly: Codable {
            struct Weather: Codable {
                let id:Int
                let main:String
                let description:String
                let item:String
            }
            let dt: Int
            let temp: Temp
            let feelsLike: Double
            let pressure, humidity: Int
            let dewPoint, windSpeed: Double
            let uvi: Double
            let visibility: Double
            let windDeg: Int
            let windGust: Double
            let weather: [Weather]
            let clouds: Int
            let pop: Double
        }
        
        enum CodingKeys: String, CodingKey {
            case dt, sunrise, sunset, moonrise, moonset
            case moonPhase = "moon_phase"
            case temp
            case feelsLike = "feels_like"
            case pressure, humidity
            case dewPoint = "dew_point"
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case windGust = "wind_gust"
            case weather, clouds, pop, rain, uvi
        }
    }
    struct Daily: Codable {
        Struct Temp: Codable{
            let day: Double
            let min: Double
            let max: Double
            let night:Double
            let eve:Double
            let morn: Double
        }
        let moonset: Int
        let moonPhase: Double
        let temp: Temp
        let feelsLike: FeelsLike
        let pressure, humidity: Int
        let dewPoint, windSpeed: Double
        let windDeg: Int
        let windGust: Double
        let weather: [Weather]
        let clouds: Int
        let pop: Double
        let rain: Double?
        let uvi: Double
    }*/
}
