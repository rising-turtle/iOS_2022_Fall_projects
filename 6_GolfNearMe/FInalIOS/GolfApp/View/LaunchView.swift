//
//  LaunchView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 12/5/22.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var VM: ViewModel
    @ObservedObject var MM : MapModel


    var body: some View {
        if VM.authorizationStatus == .authorizedAlways || VM.authorizationStatus == .authorizedWhenInUse{
            ContentView(MM: MM)
        }else if VM.authorizationStatus == .denied{
            Text("OH no permission for ya")
        }
    }
}

