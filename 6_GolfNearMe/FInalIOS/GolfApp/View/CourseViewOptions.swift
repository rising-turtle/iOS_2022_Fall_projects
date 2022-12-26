//
//  CourseViewOptions.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/15/22.
//

import SwiftUI

struct CourseViewOptions: View {
    var course : Business
    @State private var animationCount = 0.1
    
    var body: some View {
        ZStack{
            Color(red: 182/255, green: 228/255, blue: 191/255, opacity: 0.70).ignoresSafeArea()
            VStack{
                
                VStack{
                    Text("Course Options")
                        .font(.largeTitle)
                        .bold()
                    Text("Select an option for: \(course.name ?? "this course")")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }.frame(maxWidth: .infinity)
                    .padding(.init(top: 100, leading: 0, bottom: 40, trailing: 0))
                NavigationLink{
                    MapView(course: course)
                }label: {
                    Text("View Course on Map")
                        .bold()
                        .padding(.all, 30.0)
                        .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                        .foregroundColor(Color.black)
                        .cornerRadius(50)
                }
                NavigationLink{
                    WebView()
                }label: {
                    Text("Book a Tee Time")
                        .bold()
                        .padding(.all, 30.0)
                        .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                        .foregroundColor(Color.black)
                        .cornerRadius(50)
                }
                
                NavigationLink{
                    RoundInfoView(course: course)
                }label: {
                    Text("Start a Round")
                        .bold()
                        .padding(.all, 30.0)
                        .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                        .foregroundColor(Color.black)
                        .cornerRadius(50)
                }
                Spacer()
                Spacer()
            }
            
        }
    }
}

