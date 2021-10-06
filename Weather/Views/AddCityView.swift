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
            Spacer()
            
            VStack{
                Text("Instant Weather")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .padding()
                    .clipShape(Capsule())
            }
            .padding()
            
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


