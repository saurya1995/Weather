//
//  CityOverview.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI

struct CityOverview: View {
    
    @State var city: String
    @State var time: String
    
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
            Text(city)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(time)
                .font(.title3)
        }

    }
    
    private var currentWeather: some View {
        VStack{
            Image(systemName: "cloud")
                .resizable()
                .frame(width: 120, height: 120)
            
            Text("23 °")
                .font(.system(size: 64))
            
            Text("Moon Cloud Fast Wind")
        }
        .foregroundColor(.white)
        .padding()
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(
        RoundedRectangle(cornerRadius: 40)
            .fill(Color.purple)
        )
        .overlay(
        Text("Sunday, October 2 2021")
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
            ValueDescriptionStack(icon: "cloud", boldText: "42 %", description: "Feels Like")
            ValueDescriptionStack(icon: "cloud", boldText: "42 %", description: "Humidity")
            ValueDescriptionStack(icon: "cloud", boldText: "42 %", description: "Pressure")
            ValueDescriptionStack(icon: "cloud", boldText: "42 %", description: "Windspeed")
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
                
                NavigationLink(destination: Next7DaysView()){
                Text("Next 7 Days")
                Image(systemName: "chevron.right")
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal, 41)
            .font(Font.body.bold())
        
            ScrollView(.horizontal){
                HStack (spacing : 10) {
                    Spacer()
                        .frame(width: 16)
                    HourlyBox()
                    HourlyBox()
                    HourlyBox()
                    HourlyBox()
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
