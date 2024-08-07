//
//
// ResponseBody.swift
// AstanaWeatherApp
//
// Created by sturdytea on 06.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct ResponseBody: Decodable {
    let daily: [DailyResponse]
}
