//
//
// WeatherManager.swift
// AstanaWeatherApp
//
// Created by sturdytea on 04.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class WeatherManager {
    let lat = 51.16
    let lon = 71.47
    let excludePart = "minutely,hourly,alerts,current"
    let apiKey = "5ae854b2f4529bd064746c2e49aa257a"
    
    func getWeekWeather() async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=\(excludePart)&units=metric&appid=\(apiKey)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
    }
}
