//
//  WeatherdayView.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-18.
//

import SwiftUI

struct WeatherdayView: View {
    
    var dayOfTheWeek: String
    var picture: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 18))
                .foregroundColor(.white)
            Image(systemName: picture)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}
