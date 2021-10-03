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
    }
