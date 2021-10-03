//
//  ContentView.swift
//  Weather
//
//  Created by Saury Pande on 02.10.21.
//

import SwiftUI
//import XCTest

struct ContentView: View {
    @StateObject var model = ContentViewModel()
    
    var body: some View {
        //foreground layer
        NavigationView{
            TabView{
                AddCityView(model: model)
                ForEach(model.cities){ city in
                    CityOverview(city: city)
                }
                /*CityOverview(city: "New York", time: "12:40 PM")
                 CityOverview(city: "New York", time: "12:40 PM")
                 CityOverview(city: "New York", time: "12:40 PM")*/
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .navigationBarHidden(true)
            .background(
                Color.purple
                    .opacity(0.2)
                    .ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
