//
//  HourlyBox.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI

struct HourlyBox: View {
    var body: some View {
        VStack{
            Text("8:00 AM")
            
            Image(systemName: "cloud")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("23 °")
                .fontWeight(.semibold)
        }
        .foregroundColor(.white)
        .padding()
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(
        RoundedRectangle(cornerRadius: 40)
            .fill(Color.purple)
        )
    }
}

struct HourlyBox_Previews: PreviewProvider {
    static var previews: some View {
        HourlyBox()
    }
}
