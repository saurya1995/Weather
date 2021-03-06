//
//  CityOverview.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct CityOverview: View {
    @ObservedObject var model : CityOverviewModel
    
    init(city: City){
        self.model = CityOverviewModel(city: city)
    }
    
    //all these are just
    var body: some View {
        VStack(spacing: 32){
            header
            
            currentWeather
            
            informationBox
            
            dailyForecast
            
            Spacer()
        }
    }
    private var header: some View{
        VStack {
            Text(model.name)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(model.time)
                .font(.title3)
        }.padding(.top,10)
    }
    
    private var currentWeather: some View {
        VStack{
            /*Image(systemName: "cloud")
             .resizable()
             .frame(width: 120, height: 120)*/
            
            WebImage(url: model.iconURL)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 90)
            
            //Text("23 °")
            Text(model.temp)
                .font(.system(size: 64))
            
            Text(model.description)
        }
        .foregroundColor(.white)
        .padding()
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.blue)
                .opacity(0.7)
        )
        .overlay(
            Text(model.date)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white)
                )
                .offset(y: -10)
            ,alignment: .top
        )
        .padding(.horizontal, 25)
    }
    
    private var informationBox: some View{
        HStack(spacing: 16){
            ValueDescriptionStack(icon: "cloud", boldText: $model.feelsLike, description: "Feels Like")
            ValueDescriptionStack(icon: "cloud", boldText: $model.humidity, description: "Humidity")
            ValueDescriptionStack(icon: "cloud", boldText: $model.pressure, description: "Pressure")
            ValueDescriptionStack(icon: "cloud", boldText: $model.windSpeed, description: "Windspeed")
        }
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
        )
        .padding(.horizontal, 25)
    }
    
    private var dailyForecast: some View{
        VStack (spacing : 16) {
            HStack {
                Text("Today")
                
                Spacer()
                
                if(model.weatherData != nil){
                    NavigationLink(destination: Next7DaysView(forecasts: model.weatherData!.daily,name: model.name)){
                        Text("Next 7 Days")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.primary)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .opacity(0.5)
                    )
                }
            }
            .padding(.horizontal, 41)
            .font(Font.body.bold())
            
            ScrollView(.horizontal){
                HStack (spacing : 10) {
                    Spacer()
                        .frame(width: 16)
                    
                    if model.weatherData != nil{
                        ForEach(model.weatherData!.hourly, id: \.dt){ forecast in
                            let url = URL(string : "https://openweathermap.org/img/wn/\(forecast.weather.first?.icon ?? "10d")@2x.png")!
                            HourlyBox(time: model.timeFormatter.string(from: forecast.dt), icon: url, temp: "\(forecast.temp) °")
                        }
                    }
                    //let url = URL(string :"http://openweathermap.org/img/wn/10d@2x.png")!
                    //HourlyBox(time: "10 AM", icon: url, temp: "10")
                    /* HourlyBox()
                     HourlyBox()
                     HourlyBox()
                     HourlyBox()*/
                }
            }
            .padding(.vertical,30)
            
        }
    }
}

struct CityOverview_Previews: PreviewProvider {
    static var previews: some View {
        //CityOverview(city: "New York", time: "12:40 PM")
        ContentView()
    }
}
