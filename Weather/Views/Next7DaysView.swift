//
//  Next7DaysView.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI

struct Next7DaysView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var forecasts:[WeatherData.Daily]
    @State var name: String
    
    let dateFormatter: DateFormatter={
        let f=DateFormatter()
        f.dateFormat="dd/MM"
        return f
    }()
    
    var body: some View {
        VStack{
            
            navigationBar
            
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
            
            Spacer()
            
            HStack(alignment: .bottom){
                Text("Future Forecast")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            List{
                ForEach(forecasts, id: \.dt){ forecast in
                    DailyForecastView(date: dateFormatter.string(from: forecast.dt), icon: forecast.weather.first?.icon ?? "10d", high: "\(forecast.temp.max)°", low: "\(forecast.temp.min)°")
                        }
                /*DailyForecastView(date: "April 1", icon: "icon", high: "15°", low: "-2°")
                DailyForecastView(date: "April 4", icon: "icon", high: "15°", low: "-2°")*/
            }
            .listStyle(PlainListStyle())
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.white)
            )
            .padding(.horizontal, 20)

            Spacer()
        }
        .navigationBarHidden(true)
        .background(Color.blue
                        .opacity(0.2)
                        .ignoresSafeArea())
    }
    private var navigationBar: some View{
        HStack {
            Button(action: {
                //this will dismiss the current view
                presentationMode.wrappedValue.dismiss()
            }){
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
            .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
    }
}

/*
struct Next7DaysView_Previews: PreviewProvider {
    static var previews: some View {
        Next7DaysView()
    }
}*/
