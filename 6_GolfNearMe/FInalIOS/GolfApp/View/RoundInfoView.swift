//
//  RoundInfoView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 12/7/22.
//

import SwiftUI

struct RoundInfoView: View {
    
    @EnvironmentObject var courseVM : ViewModel
    var course : Business
    var is18 : Bool = true
    var is9 : Bool = true
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                
                Color(red: 182/255, green: 228/255, blue: 191/255, opacity: 0.70).ignoresSafeArea()
                
                VStack(){
                    
                    VStack{
                        Text("Select Round Options")
                            .font(.largeTitle)
                            .bold()
                        Text("Select the type of round at \(course.name ?? "this course")")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }.frame(maxWidth: .infinity)
                        .padding(.init(top: 60, leading: 0, bottom: 40, trailing: 0))
                   
                    HStack{
                        NavigationLink{
                            ScorecardView(is9: is9, course : course)
                        }label: {
                                Text("9 Hole Round?")
                                    .bold()
                                    .padding(.all, 30.0)
                                    .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                                    .foregroundColor(Color.black)
                                    .cornerRadius(20)
                        }
                        NavigationLink{
                            ScorecardView(is18: is18, course : course)
                        }label: {
                                Text("18 Hole Round?")
                                    .bold()
                                    .padding(.all, 30.0)
                                    .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                                    .foregroundColor(Color.black)
                                    .cornerRadius(20)
                        }
                        
                    }
                    Spacer()

                }
            }
        }
        
    }
}

