//
//  CityOverviewModel.swift
//  Weather
//
//  Created by Saurya on 03.10.21.
//

import SwiftUI
import Combine

final class CityOverviewModel: ObservableObject{
    @Published var lat: Double
    @Published var long: Double
    @Published var weatherData: WeatherData?
    
    private var cancellables=Set<AnyCancellable>()
    
    var icon:String{
        weatherData?.current.weather.first?.icon ??
        "10d"
    }
    
    var iconURL: URL{
        URL(string : "https://openweathermap.org/img/wn/\(icon)@2x.png")!
    }
    var temp: String{
        "\(weatherData?.current.temp ?? 0)°"
    }
    
    var description: String{
        weatherData?.current.weather.first?.description ?? ""
    }
    
    var feelsLike: String{
        "\(weatherData?.current.feelsLike ?? 0)"
    }
    
    var pressure: String{
        "\(weatherData?.current.pressure ?? 0)"
    }
    
    var humidity: String{
        "\(weatherData?.current.humidity ?? 0)"
    }
    
    var windSpeed: String{
        "\(weatherData?.current.windSpeed ?? 0)"
    }
    
    init(lat: Double, long: Double){
        self.lat=lat
        self.long=long
        load()
    }
    
    func load(){
        WeatherService.getWeatherData(lat: lat, long: long)
            .sink { (completion) in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                case .finished: return
                }
            } receiveValue: { [weak self](WeatherData) in
                self?.weatherData = WeatherData
                dump(WeatherData)
            }
            .store(in: &cancellables)
    }
}
