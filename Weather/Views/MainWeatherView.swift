//
//  MainWeatherView.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-18.
//

import SwiftUI

struct MainWeatherView: View {
    var picture: String
    var temp: Int
    
    var body: some View {
        Image(systemName: picture)
            .symbolRenderingMode(.multicolor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
        Text("\(temp)°")
            .font(.system(size: 70))
            .foregroundColor(.white)
    }
}
