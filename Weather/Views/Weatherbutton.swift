//
//  Weatherbutton.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-05-25.
//

import SwiftUI

struct Weatherbutton: View {
    var title: String
    var fontcolor: Color
    
    var body: some View {
        Text(title)
            .foregroundColor(fontcolor)
            .frame(width: 280, height: 50)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        Weatherbutton(title: "test title", fontcolor: .white)
            
    }
}
