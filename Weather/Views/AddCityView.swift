//
//  AddCityView.swift
//  Weather
//
//  Created by Saurya on 03.10.21.
//

import SwiftUI

struct AddCityView: View {
    @ObservedObject var model: ContentViewModel
    
    var body: some View {
        
        VStack{
            VStack{
                Text("Instant Weather")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .padding(120)
            
            VStack{
                TextField("New City", text: $model.newCityName)
                
                Button("Add City", action: model.addCity)
            }
            .padding()
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.white)
            )
            .padding(.horizontal, 25)
            
            Spacer()
        }
    }
}


