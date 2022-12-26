//
//  GolfAppApp.swift
//  Shared
//
//  Created by Tyler Fontana on 11/12/22.
//

import SwiftUI

@main
struct GolfAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(MM: MapModel()).environmentObject(ViewModel())
        }
    }
}
