//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Burak AKIN on 1/9/24.
//

import SwiftUI
 
struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue , bottomColor: Color("lightBlue"))
            
            VStack{
                CityTextView(cityName: "Miami, FL")
                
                MainWeatherStatusView(imageName:"cloud.sun.fill", temperature: 76)
                
                VStack (spacing : 10){
                   
                    HStack (spacing: 20){
                        WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 23)
                        WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.rain.fill", temperature: 21)
                        WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 22)
                        WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 23)
                        WeatherDayView(dayOfWeek: "SAT", imageName: "sun.rain.fill", temperature: 21)
                    }
                    
                    Spacer()
                
                    
                    Button{
                         print("tapped")
                    } label : {
                        Text("Change Day Time")
                            .frame(width: 280, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
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
                .renderingMode(.original)
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
    
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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

struct MainWeatherStatusView : View {
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundStyle(.white)
        
            .padding(.bottom, 48)
    }
}
