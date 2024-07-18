//
//  WeatherManager.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-17.
//
import Foundation

class WeatherManager: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var forecast: [ForecastResponse.Forecast] = []
    private let apiKey = "b3f8f0f2fd4125196fe8c7f9997059f8" // Replace with your actual API key
    
    func fetchWeather(for city: String) {
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        let forecastURL = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric"
        
        fetchWeatherData(from: weatherURL) { (weather: WeatherResponse?) in
            DispatchQueue.main.async {
                self.weather = weather
                print("Current weather data: \(String(describing: weather))")
            }
        }
        
        fetchWeatherData(from: forecastURL) { (forecastResponse: ForecastResponse?) in
            DispatchQueue.main.async {
                if let forecastResponse = forecastResponse {
                    self.forecast = self.filterDailyForecasts(from: forecastResponse.list)
                    print("Filtered forecast data count: \(self.forecast.count)")
                } else {
                    print("No forecast data available")
                }
            }
        }
    }
    
    private func filterDailyForecasts(from forecasts: [ForecastResponse.Forecast]) -> [ForecastResponse.Forecast] {
        var dailyForecasts: [String: ForecastResponse.Forecast] = [:]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        for forecast in forecasts {
            let date = Date(timeIntervalSince1970: forecast.dt)
            let dateString = dateFormatter.string(from: date)
            
            if dailyForecasts[dateString] == nil {
                dailyForecasts[dateString] = forecast
            }
        }
        
        return Array(dailyForecasts.values).sorted { $0.dt < $1.dt }
    }
    
    private func fetchWeatherData<T: Decodable>(from urlString: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error making network request: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

