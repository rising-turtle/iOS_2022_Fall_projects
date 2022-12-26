//
//  ContentView.swift
//  Shared
//
//  Created by Tyler Fontana on 11/12/22.
//

import SwiftUI
struct ContentView: View {
    
    @EnvironmentObject var courseVM : ViewModel
    @ObservedObject var MM: MapModel
    var body: some View {
        
            TabView{
                CourseView(MM: MM).tabItem {
                    Image(systemName:
                    "globe.americas")
                    Text("Courses")
                }
                ScoreboardView().tabItem{
                    Image(systemName: "list.number")
                    Text("Score Board")
                }
                HandicapView().tabItem{
                    Image(systemName: "plus.forwardslash.minus")
                    Text("Handicap")
                }
                
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
//    @ObservedObject var mm: MapModel
    static var previews: some View {
        ContentView(MM: MapModel()).environmentObject(ViewModel())//.environmentObject(MapModel())
    }
}
