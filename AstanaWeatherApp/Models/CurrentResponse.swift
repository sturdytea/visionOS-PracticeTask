//
//
// CurrentResponse.swift
// AstanaWeatherApp
//
// Created by sturdytea on 06.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct CurrentResponse: Decodable {
    let dt: Int
    let temp: Double
    let weather: [WeatherResponse]
}
