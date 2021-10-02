//
//  ContentView.swift
//  Weather
//
//  Created by Saury Pande on 02.10.21.
//

import SwiftUI
//import XCTest

struct ContentView: View {
    var body: some View {
        ZStack{
            //background Layer
            Color.purple
                .opacity(0.1)
                .ignoresSafeArea()

           //foreground layer
            VStack(spacing: 32){
                VStack {
                    Text("New York")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("12.45 PM")
                        .font(.title3)
                }
        
                
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
            
            HStack(spacing: 10){
                ValueDescriptionStack()
                ValueDescriptionStack()
                ValueDescriptionStack()
                ValueDescriptionStack()
            }
            .padding()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
            )
            .padding(.horizontal, 25)
            
                VStack (spacing : 16) {
                    HStack {
                        Text("Today")
                        
                        Spacer()
                        
                        Text("Next 7 Days")
                        Image(systemName: "chevron.right")
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
                
            Spacer()
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
