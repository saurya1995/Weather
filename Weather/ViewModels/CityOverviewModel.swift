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
    @Published var iconURL: URL = URL(string : "https://openweathermap.org/img/wn/10d@2x.png")!
    @Published var temp:String = ""
    @Published var description:String = ""
    @Published var feelsLike:String = ""
    @Published var pressure:String = ""
    @Published var humidity:String = ""
    @Published var windSpeed:String = ""
    
    private var cancellables=Set<AnyCancellable>()
    let dateFormatter: DateFormatter={
        let f=DateFormatter()
        f.dateFormat="HH:mm"
        return f
    }()
    
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
            } receiveValue: { [weak self](weatherData) in
                DispatchQueue.main.async {
                    self?.weatherData = weatherData
                    let icon = weatherData.current.weather.first?.icon ?? "10d"
                    self?.iconURL = URL(string : "https://openweathermap.org/img/wn/\(icon)@2x.png")!
                    self?.temp = "\(weatherData.current.temp) °"
                    self?.description = "\(weatherData.current.weather.first?.description ?? "") °"
                    self?.temp = "\(weatherData.current.feelsLike) °"
                    self?.temp = "\(weatherData.current.pressure)"
                    self?.temp = "\(weatherData.current.humidity)"
                    self?.temp = "\(weatherData.current.windSpeed)"
                }
            }
            .store(in: &cancellables)
    }
}
