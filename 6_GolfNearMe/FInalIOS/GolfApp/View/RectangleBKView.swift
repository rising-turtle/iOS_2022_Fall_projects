//
//  RectangleBKView.swift
//  GolfApp
//
//  Created by Aaron McFeaters on 12/7/22.
//

import SwiftUI

struct RectangleBKView: View {
    var height: Double = 50
    var body: some View {
        Rectangle()
            .fill(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
            .cornerRadius(10.0)
            .shadow(radius: 5.0)
            .frame(height: height)
            .padding(.leading, 10)
            .padding(.trailing, 10)
    }
}
