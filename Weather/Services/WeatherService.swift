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
    
    
    static func getCity(for name: String) async throws -> [City]{
        guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(name)&limit=1&appid=\(Statics.apiKey)") else {
            throw WeatherServiceError.invalidURL
        }
        let (data, response)  = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        
        let citiesResult = try JSONDecoder().decode([City].self, from: data)
        return citiesResult
    }
    
}

enum WeatherServiceError: Error{
    case invalidURL
}
