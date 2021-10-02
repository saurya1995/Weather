//
//  ValueDescriptionStack.swift
//  Weather
//
//  Created by Saury Pande on 02.10.21.
//

import SwiftUI

struct ValueDescriptionStack: View {
    var body: some View {
        VStack{
        Image(systemName: "house")
        Text("42 %")
            .fontWeight(.bold)
        
        Text("Precipitation")
            .font(.footnote)
            .foregroundColor(.gray)
        }
    }
}

struct ValueDescriptionStack_Previews: PreviewProvider {
    static var previews: some View {
        ValueDescriptionStack()
    }
}
