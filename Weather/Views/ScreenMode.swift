//
//  ScreenMode.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-07-18.
//

import SwiftUI

struct ScreenMode: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
