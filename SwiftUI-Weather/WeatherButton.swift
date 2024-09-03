//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Burak AKIN on 2/9/24.
//

import SwiftUI

struct WeatherButton : View {
    
    var title : String
    var backgroundColor : Color
    
    var body: some View {
        
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
