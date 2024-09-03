//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Burak AKIN on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(cityName: "Miami, FL")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars" : "cloud.sun.fill", temperature: 76)
                   
                
                VStack (spacing : 10){
                    
                    HStack (spacing: 20){
                        WeatherDayView(dayOfWeek: "TUE",
                                       imageName: "sun.max.fill",
                                       temperature: 23)
                        
                        WeatherDayView(dayOfWeek: "WED",
                                       imageName: "cloud.sun.rain.fill",
                                       temperature: 21)
                        
                        WeatherDayView(dayOfWeek: "THU",
                                       imageName: "cloud.sun.fill",
                                       temperature: 22)
                        
                        WeatherDayView(dayOfWeek: "FRI",
                                       imageName: "cloud.sun.fill",
                                       temperature: 23)
                        
                        WeatherDayView(dayOfWeek: "SAT",
                                       imageName: "sun.rain.fill",
                                       temperature: 21)
                    }
                    
                    Spacer()
                    
                    NewWeatherButton(isNightSetter: $isNight, title: "New Change Day Time", backgroundColor: Color.white)
                    
                    Button{
                        isNight.toggle()
                    } label : {
                        WeatherButton(title: "Change Day Time", backgroundColor: Color.white)
                    }
                    Spacer()
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}


struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(Color(.white))
            
        }
        
    }
}

struct BackgroundView: View {
    
    var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient:  Gradient(colors: [ isNight ? .black : .blue , isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView : View {
    
    var cityName : String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(Color(.white))
            .padding()
    }
}

struct NewWeatherButton : View {
    
    @Binding var isNightSetter : Bool
    var title : String
    var backgroundColor : Color
    
    var body: some View {
        
        Button{
            isNightSetter.toggle()
        } label : {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .cornerRadius(10)
        }
    }
}

struct MainWeatherStatusView : View {
    
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
            .foregroundStyle(.white)
        
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundStyle(.white)
            .padding(.bottom, 48)
    }
}

