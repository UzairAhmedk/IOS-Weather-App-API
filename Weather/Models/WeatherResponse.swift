//
//  WeatherResponse.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-17.
//
import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
    struct Main: Decodable {
        let temp: Double
        let humidity: Int
    }
    
    struct Weather: Decodable {
        let description: String
        let icon: String
    }

    struct Wind: Decodable {
        let speed: Double
    }
}
