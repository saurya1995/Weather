//
//  WeatherService.swift
//  Weather
//
//  Created by Saurya on 03.10.21.
//

import Combine
import Foundation

struct WeatherService{
    static func getWeatherData(lat: Double, long: Double, units:String="metric") -> AnyPublisher<WeatherData, Error>{
        let url=URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&units=\(units)&appid=\(Statics.apiKey)")!
        
        /*let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
        
        print("inside weather service", publisher)*/
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap{
                element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                return element.data
            }
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    /*static func getWeatherData(lat: Double, long: Double, units:String="metric") async throws -> WeatherData{
     let url=URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&units=\(units)&appid=\(Statics.apiKey)")!
     
     let (data, _) = try await URLSession.shared.data(from: url)
     let weatherdata = try JSONDecoder().decode(WeatherData.self, from: data)
     return weatherdata
     }*/
    
    static func getCity(for name: String)->AnyPublisher<[City], Error>{
        let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(name)&limit=1&appid=\(Statics.apiKey)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap{
                element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                return element.data
            }
            .decode(type: [City].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
