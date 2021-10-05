//
//  HourlyBox.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct HourlyBox: View {
    @State var time: String
    @State var icon: URL
    @State var temp: String
    
    var body: some View {
        VStack{
            Text("8:00 AM")
            //Text(time)
            
            WebImage(url: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(temp)
                .fontWeight(.semibold)
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
    }
}

/*
struct HourlyBox_Previews: PreviewProvider {
    static var previews: some View {
        HourlyBox()
    }
}
*/
