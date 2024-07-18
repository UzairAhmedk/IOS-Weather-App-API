//
//  ForecastResponse.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-17.
//
import Foundation

struct ForecastResponse: Decodable {
    let list: [Forecast]
    
    struct Forecast: Decodable, Identifiable {
        let id = UUID() // Adding an `id` to conform to `Identifiable`
        let dt: TimeInterval
        let main: Main
        let weather: [Weather]
        
        struct Main: Decodable {
            let temp: Double
        }
        
        struct Weather: Decodable {
            let description: String
            let icon: String
        }
    }
}
