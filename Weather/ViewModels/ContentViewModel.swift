//
//  ContentViewModel.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI
import Combine

final class ContentViewModel: ObservableObject {
    @Published var cities = [City]()
    @Published var newCityName = ""
    
    private var cancellables=Set<AnyCancellable>()
    
    init(){
        cities = City.placeholder
    }
    
    func addCity(){
        var flag = true
        for city in cities{
            if city.name==newCityName{
                flag=false
                print("Already Added \(newCityName)")
            }
        }
        
        if flag {
            Task.init {
                do{
                    let newcities:[City] = try await WeatherService.getCity(for: newCityName)
                    for newcity in newcities{
                        cities.append(newcity)
                    }
                } catch{
                    print("Request failed with error: \(error)")
                }
            }
        }
    }
    
    
}
