//
//
// DailyResponse.swift
// AstanaWeatherApp
//
// Created by sturdytea on 06.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct DailyResponse: Decodable {
    let dt: Int
    let temp: TemperatureResponse
    let weather: [WeatherResponse]
    
    var tempInt: Int {
        return Int(temp.day.rounded())
    }
    
    var weekDay: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeek = dateFormatter.string(from: date)
        return dayOfWeek
    }
}
