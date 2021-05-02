//
//  dataModel.swift
//  HomeWork 12.1
//
//  Created by Влад Бокин on 27.04.2021.
//

import Foundation

//MARK: - DATA MODEL
//
//
//
// MARK: - Weather
struct weatherResponse: Codable {
    let lat, lon: Double
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let minutely: [Minutely]?
    let hourly: [Current]?
    let daily: [Daily]?
    let alerts: [Alert]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset
        case current, minutely, hourly, daily, alerts
    }
}

// MARK: - Alert
struct Alert: Codable {
    let senderName, event: String?
    let start, end: Int?
    let alertDescription: String?

    enum CodingKeys: String, CodingKey {
        case senderName
        case event, start, end
        case alertDescription
    }
}

// MARK: - Current
struct Current: Codable {
    let dt: Int?
    let sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElement]?
    let snow: Snow?
    let windGust, pop: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike
        case pressure, humidity
        case dewPoint
        case uvi, clouds, visibility
        case windSpeed
        case windDeg
        case weather, snow
        case windGust
        case pop
    }
}

// MARK: - Snow
struct Snow: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int?
    let main: Main
    let weatherDescription: Description?
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription
        case icon
    }
}
enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02D = "02d"
    case the03D = "03d"
    case the04D = "04d"
    case the10D = "10d"
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case snow = "Snow"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightSnow = "light snow"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    case snow = "snow"
    case moderateRain = "moderate rain"
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElement]
    let clouds: Int?
    let pop: Double?
    let snow: Double?
    let uvi: Double?
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike
        case pressure, humidity
        case dewPoint
        case windSpeed
        case windDeg
        case weather, clouds, pop, snow, uvi, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Minutely
struct Minutely: Codable {
    let dt: Int
    let precipitation: Double
}
