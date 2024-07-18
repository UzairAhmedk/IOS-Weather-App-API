import SwiftUI

struct ContentView: View {
    
    @State private var cityName: String = ""
    @StateObject private var weatherManager = WeatherManager()
    
    var body: some View {
        ZStack {
            ScreenMode()
            VStack {
                if let weather = weatherManager.weather {
                    CityTextView(CityName: weather.name)
                    MainWeatherView(picture: mapIconToSFIcon(icon: weather.weather.first?.icon ?? "cloud.fill"), temp: Int(weather.main.temp))
                    Text(weather.weather.first?.description.capitalized ?? "Unknown")
                        .font(.title2)
                        .foregroundColor(.white)
                    HStack {
                        Text("Humidity: \(weather.main.humidity)%")
                            .foregroundColor(.white)
                        Text("Wind Speed: \(weather.wind.speed, specifier: "%.1f") m/s")
                            .foregroundColor(.white)
                    }
                } else {
                    CityTextView(CityName: "Enter a city")
                }
                Spacer()
                
                HStack(spacing: 30) {
                    ForEach(weatherManager.forecast.prefix(5)) { forecast in
                        WeatherdayView(
                            dayOfTheWeek: getDayOfWeek(from: forecast.dt),
                            picture: mapIconToSFIcon(icon: forecast.weather.first?.icon ?? "cloud.fill"),
                            temp: Int(forecast.main.temp)
                        )
                    }
                }
                Spacer()
                
                TextField("Enter city name", text: $cityName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                
                Button {
                    print("Search button clicked")
                    weatherManager.fetchWeather(for: cityName)
                } label: {
                    Weatherbutton(title: "Search", fontcolor: .black)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

