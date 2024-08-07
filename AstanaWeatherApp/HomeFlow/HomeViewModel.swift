//
//
// HomeViewModel.swift
// AstanaWeatherApp
//
// Created by sturdytea on 03.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

protocol ViewModelProtocol {
    func fetchWeatherRecords() async
}

class HomeViewModel: ViewModelProtocol {

    var weatherManager: WeatherManager
    var weekWeatherRecords: [DailyResponse] = []
    
    var sections: [Section] = []
    
    init() {
        weatherManager = WeatherManager()
    }
    
    func fetchWeatherRecords() async {
        do {
            try weekWeatherRecords = await weatherManager.getWeekWeather().daily
        } catch {
            print("Error fetching weather")
        }
    }
}
