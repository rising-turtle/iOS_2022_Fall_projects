//
//  ScoreboardView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/15/22.
//

import SwiftUI

struct ScoreboardView: View {
    @EnvironmentObject var courseVM : ViewModel
    
    var body: some View {
            ZStack{
                Color(red: 182/255, green: 228/255, blue: 191/255, opacity: 0.70).ignoresSafeArea()
                VStack{
                    
                    
                    VStack{
                        Text("Scoreboard")
                            .font(.largeTitle)
                            .bold()
                        Text("All Previous rounds will appear here")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }.frame(maxWidth: .infinity)
                        
                    ScrollView{
                    ForEach(courseVM.allRounds, id: \.id){ r in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                                    .frame(height: 140)
                                    .padding(.init(top: 10, leading: 7, bottom: 0, trailing: 7))
                                VStack{
                                    
                                    Text("Course Played: \(r.courseName)").bold().frame(width: 380, alignment: .leading)
                                        .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                                     
                                    Text("Course Rating: \(r.courseRating)").bold().frame(width: 380, alignment: .leading)
                                        .padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                                        
                
                                    HStack{
                                        Text("Total Strokes: \(r.totalStrokes)").bold()
                                    
                                        Text("Course Par: \(r.coursePar)").bold()
                                          
                                        Text("Net Score: \(r.totalStrokes - r.coursePar)").bold()
                                            
                                    }.frame(width: 380, alignment: .leading)
                                        .padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                                }
                                    
                                
                                
                            }
                            
                    
                        
                    }
                        
                        
                }
                    
            }.navigationBarHidden(true)
                        
        }
                
    }
}
        
