//
//  CityTextView.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-18.
//

import SwiftUI

struct CityTextView: View {
    
    var CityName: String
    var body: some View {
        Text(CityName)
            .font(.system(size: 32))
            .foregroundColor(.white)
            .padding()
    }
}
