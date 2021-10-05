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
    @Published var name=""
    @Published var time=""
    @Published var date=""
    
    @Published var weatherData: WeatherData?
    @Published var iconURL: URL = URL(string : "https://openweathermap.org/img/wn/10d@2x.png")!
    @Published var temp:String = ""
    @Published var description:String = ""
    @Published var feelsLike:String = ""
    @Published var pressure:String = ""
    @Published var humidity:String = ""
    @Published var windSpeed:String = ""
    
    private var cancellables=Set<AnyCancellable>()
    let timeFormatter: DateFormatter={
        let f=DateFormatter()
        f.dateFormat="HH:mm"
        return f
    }()
    
    let dateFormatter: DateFormatter={
        let f=DateFormatter()
        f.dateFormat="EEEE, MMMM dd"
        return f
    }()
    
    init(city: City){
        self.lat=city.lat
        self.long=city.lon
        self.name=city.name
        self.time=timeFormatter.string(from: Date())
        self.date=dateFormatter.string(from: Date())
        print("latitude",lat)
        load()

    }
    
    func load(){
        
        WeatherService.getWeatherData(lat: lat, long: long)
            .sink { (completion) in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                    print("inside sink subscriber")
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
                    self?.feelsLike = "\(weatherData.current.feelsLike) °"
                    self?.pressure = "\(weatherData.current.pressure)"
                    self?.humidity = "\(weatherData.current.humidity)"
                    self?.windSpeed = "\(weatherData.current.windSpeed)"
                }
            }
            .store(in: &cancellables)
      /*  do{
            weatherData = try await WeatherService.getWeatherData(lat: lat, long: long)
            let icon = weatherData?.current.weather.first?.icon ?? "10d"
            iconURL = URL(string : "https://openweathermap.org/img/wn/\(icon)@2x.png")!
            temp = "\(weatherData?.current.temp ?? 0) °"
            description = "\(weatherData?.current.weather.first?.description ?? " ") °"
            feelsLike = "\(weatherData?.current.feelsLike ?? 0) °"
            pressure = "\(weatherData?.current.pressure ?? 0)"
            humidity = "\(weatherData?.current.humidity ?? 0)"
            windSpeed = "\(weatherData?.current.windSpeed ?? 0)"
        } catch{
            print(error)
        }*/
    }
}
