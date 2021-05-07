//
//  WheatherModel.swift
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
        let main: MainCurrent?
        let wind: Wind?
        let dt: Int?
        let name: String?
    }

    // MARK: - Main
    struct MainCurrent: Codable {
        let temp, feels_like: Double?
        let temp_min: Double?
        let temp_max: Double?
        let pressure, humidity: Int?

        enum CodingKeys: String, CodingKey {
            case temp
            case feels_like
            case temp_min
            case temp_max
            case pressure, humidity
        }
    }

    // MARK: - Wind
    struct Wind: Codable {
        let speed, deg: Double?
    }
