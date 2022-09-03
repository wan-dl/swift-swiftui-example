//
//  api_WeatherKit.swift
//  HelloSwift
//
//  Created by 1 on 9/3/22.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct api_WeatherKit: View {
    var body: some View {
        VStack {
            Button("获取天气信息", action: {
                if #available(iOS 16.0, *) {
                    getWeather()
                } else {
                    Text("简介：本页面使用了WeatherKit，仅适用于iOS 16.0+")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            })
        }
    }
    
    @available (iOS 16.0, *)
    func getWeather() {
        Task {
            let weatherService = WeatherService()

            let syracuse = CLLocation(latitude: 43, longitude: -76)
            let weather = try! await weatherService.weather(for: syracuse)
            let temperature = weather.currentWeather.temperature
            print(temperature)
            let uvIndex = weather.currentWeather.uvIndex
        }
    }
}

struct api_WeatherKit_Previews: PreviewProvider {
    static var previews: some View {
        api_WeatherKit()
    }
}
