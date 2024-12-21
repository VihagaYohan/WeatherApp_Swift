//
//  ContentView.swift
//  WeatherApp
//
//  Created by Yohan on 2024-12-21.
//

import SwiftUI

struct ContentView: View {
    // states
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundGradient(isNight: $isNight)
        
            VStack {
                CityTextView(cityName:"Cupertino, CA")
                
                MainWeatherView(
                    imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: "76"
                )
                
                HStack(spacing: 14){
                    WeatherDayView(dayOfWeek: "MON",
                                   weather: "cloud.sun.fill",
                                   temperature:"23")
                    WeatherDayView(dayOfWeek: "MON",
                                   weather: "sun.max.fill",
                                   temperature:"23")
                    WeatherDayView(dayOfWeek: "MON",
                                   weather: "wind.snow",
                                   temperature:"23")
                    WeatherDayView(dayOfWeek: "MON",
                                   weather: "sunset.fill",
                                   temperature:"23")
                }
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change D ay Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10.0)
                }
                     
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weather: String
    var temperature: String
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: weather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature) Celsius")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundGradient: View {
    // binding
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isNight ? .black: .blue,
            isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text(temperature)
                .font(.system(size: 76, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom)
    }
}
