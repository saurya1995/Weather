//
//  ContentViewModel.swift
//  Weather
//
//  Created by Saurya on 02.10.21.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var cities = [City]()
    
    init(){
        cities = City.placeHolder
    }
}
