//
//  DailyForecastView.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI

struct DailyForecastView: View {
    @State var date: String
    @State var icon: String
    @State var high: String
    @State var low: String
    
    var body: some View {
        HStack{
            Text(date)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            
            Image(systemName: icon)
            
            VStack{
                Text(high)
                    .fontWeight(.semibold)
                
                Text(low)
            }
        }
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(date: "April 1", icon: "icon", high: "15°", low: "-2°")
    }
}
