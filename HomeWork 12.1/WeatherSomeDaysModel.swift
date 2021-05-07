//
//  WeatherSomeDaysModel.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 07.05.2021.
//

import Alamofire
import Foundation

// MARK: - Welcome
struct WeatherSomeDays: Codable {
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case current, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable {
    let dt: Int?
    let temp, feelsLike: Double?
    let windSpeed: Double?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let main: Main?

    enum CodingKeys: String, CodingKey {
        case main
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

// MARK: - Daily
struct Daily: Codable {
    let dt: Int?
    let temp: Temp?
    let windSpeed: Double?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
}
