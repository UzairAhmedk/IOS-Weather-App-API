//
//  Helpers.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-18.
//

import Foundation

func getDayOfWeek(from timestamp: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timestamp)
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    return formatter.string(from: date)
}

func mapIconToSFIcon(icon: String) -> String {
    // Map OpenWeatherMap icons to SF Symbols or custom icons
    switch icon {
    case "01d":
        return "sun.max.fill"
    case "01n":
        return "moon.stars.fill"
    case "02d":
        return "cloud.sun.fill"
    case "02n":
        return "cloud.moon.fill"
    case "03d", "03n":
        return "cloud.fill"
    case "04d", "04n":
        return "smoke.fill"
    case "09d", "09n":
        return "cloud.drizzle.fill"
    case "10d":
        return "cloud.sun.rain.fill"
    case "10n":
        return "cloud.moon.rain.fill"
    case "11d", "11n":
        return "cloud.bolt.rain.fill"
    case "13d", "13n":
        return "snow"
    case "50d", "50n":
        return "cloud.fog.fill"
    default:
        return "cloud.fill"
    }
}
