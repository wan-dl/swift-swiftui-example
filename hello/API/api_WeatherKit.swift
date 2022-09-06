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
    @State var errorMsg: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("简介：本页面使用了WeatherKit，仅适用于iOS 16.0+")
                .font(.callout)
                .foregroundColor(.gray)
            
            if #available(iOS 16.0, *) {
                Button("获取天气信息", action: {
                    getWeather()
                })
                .buttonStyle(.borderedProminent)
                .font(.body)
            }
            
            if errorMsg != "" {
                Text(errorMsg)
                    .font(.caption2)
                    .offset(y: 40)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("WeatherKit")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @available (iOS 16.0, *)
    func getWeather() {
        Task {
            do {
                let weatherService = WeatherService()

                let syracuse = CLLocation(latitude: 43, longitude: -76)
                let weather = try await weatherService.weather(for: syracuse)
                let temperature = weather.currentWeather.temperature
                print("------------\(temperature)")
                let uvIndex = weather.currentWeather.uvIndex
            } catch let error {
                errorMsg = "::代码执行，异常错误 -> \(error)"
                print(errorMsg)
            }
        }
    }
}

struct api_WeatherKit_Previews: PreviewProvider {
    static var previews: some View {
        api_WeatherKit()
    }
}
