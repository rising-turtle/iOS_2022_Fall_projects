//
//  ScorecardView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/12/22.
//

import SwiftUI
import Combine


struct ScorecardView: View {
    @EnvironmentObject var courseVM : ViewModel
    var is18 : Bool?
    var is9 : Bool?
    var course : Business
    @State var tmpPar : Int = 3
    @State var tmpStrokes : Int = 1
    @State var tmpHole : Int = 1
    @State var choiceMade = "Course Options"
    @State var tmpCourseRating : String = "0"
    @State var tmpCourseSlope : String = "0"
    @State var tmpRoundPlayed = [Hole]()
    @State var showAlert = false
    @State var courseName : String = ""
    var body: some View {
        ZStack{
            Color(red: 182/255, green: 228/255, blue: 191/255, opacity: 0.70).ignoresSafeArea()
            VStack{
                
                Text("Scorecard for \(course.name ?? "Generic Course")")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
                if(is18 ?? false){
                    
                    Text("Hole \(tmpHole)")
                        .font(.title)
                        .bold()
                        .padding()
                    Stepper(value: $tmpPar, in: 3...6){
                        Text("Par: \(tmpPar)")
                            .bold()
                            .padding()
                            
                    }
                    Stepper(value: $tmpStrokes, in: 1...15){
                        Text("Score: \(tmpStrokes)")
                            .bold()
                            .padding()
                    }
                    
                    if(tmpHole == 1){
                        HStack{
                           Text("Course Rating")
                                .bold()
                                .padding()
                            TextField("Enter the Course Rating", text: $tmpCourseRating)
                            
                                        .onReceive(Just(tmpCourseRating)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.tmpCourseRating = filtered
                                            }
                                        }
                                        .padding()
                            
                        }
                        HStack{
                           Text("Course Slope")
                                .bold()
                                .padding()
                            TextField("Enter the Course Slope", text: $tmpCourseSlope)
                            
                                        .onReceive(Just(tmpCourseSlope)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.tmpCourseSlope = filtered
                                            }
                                        }
                                        .padding()
                            
                        }
                        
                        
                    }
                    if(tmpHole == 18){
                        Button{
                
                            tmpRoundPlayed.append(Hole(holeNum: tmpHole, par: tmpPar, strokes: tmpStrokes))
                                                        
                            var tmpTotalPar : Int = 0
                            var tmpTotalStrokes : Int = 0
                            var rt = RoundTotal()
                            for i in 0..<18{

                               
                                rt.roundPlayed.append(tmpRoundPlayed[i])
                                                                
                                tmpTotalPar = tmpTotalPar + rt.roundPlayed[i].par
                                tmpTotalStrokes = tmpTotalStrokes + rt.roundPlayed[i].strokes
                            }
                            rt.coursePar = tmpTotalPar
                            rt.totalStrokes = tmpTotalStrokes
                            rt.courseSlope = Int(tmpCourseSlope)!
                            rt.courseRating = Int(tmpCourseRating)!
                            rt.numHoles = 18
                            rt.courseName = course.name ?? "Course Not Available"
                            courseVM.allRounds.append(rt)
                            
                            showAlert = true
                        }label: {
                            Text("Click to Confirm Score and Finish Round")
                                .bold()
                                .padding(.all, 30.0)
                                .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                                .foregroundColor(Color.black)
                                .cornerRadius(20)
                                .alert(isPresented: $showAlert) {
                                      Alert(title: Text("Round Complete"),message: Text("View your score on the scoreboard!"))
                                }
                        }
                    }else{
                        Button{
                            
                            
                            tmpRoundPlayed.append(Hole(holeNum: tmpHole, par: tmpPar, strokes: tmpStrokes))
                            tmpHole = tmpHole + 1
                            tmpPar = 3
                            tmpStrokes = 1
                            
                            
                        }label: {
                            Text("Confirm Score")
                                .bold()
                                .padding(.all, 30.0)
                                .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                                .foregroundColor(Color.black)
                                .cornerRadius(20)
                        }
                    }
                   
                    Spacer()
                }else if (is9 ?? false){
                    Text("Hole \(tmpHole)")
                        .font(.title)
                        .bold()
                        .padding()
                    Stepper(value: $tmpPar, in: 3...6){
                        Text("Par: \(tmpPar)")
                            .bold()
                            .padding()
                            
                    }
                    Stepper(value: $tmpStrokes, in: 1...15){
                        Text("Score: \(tmpStrokes)")
                            .bold()
                            .padding()
                    }
                    
                    if(tmpHole == 1){
                        HStack{
                           Text("Course Rating")
                                .bold()
                                .padding()
                            TextField("Enter the Course Rating", text: $tmpCourseRating)
                            
                                        .onReceive(Just(tmpCourseRating)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.tmpCourseRating = filtered
                                            }
                                        }
                                        .padding()
                            
                        }
                        HStack{
                           Text("Course Slope")
                                .bold()
                                .padding()
                            TextField("Enter the Course Slope", text: $tmpCourseSlope)
                            
                                        .onReceive(Just(tmpCourseSlope)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.tmpCourseSlope = filtered
                                            }
                                        }
                                        .padding()
                            
                        }
                        
                        
                    }
                    if(tmpHole == 9){
                        Button{
                
                            tmpRoundPlayed.append(Hole(holeNum: tmpHole, par: tmpPar, strokes: tmpStrokes))
                            

                            
                            var tmpTotalPar : Int = 0
                            var tmpTotalStrokes : Int = 0
                            var rt = RoundTotal()
                            for i in 0..<9{
     
                                rt.roundPlayed.append(tmpRoundPlayed[i])
                                
                                
                                tmpTotalPar = tmpTotalPar + rt.roundPlayed[i].par
                                tmpTotalStrokes = tmpTotalStrokes + rt.roundPlayed[i].strokes
                            }
                            rt.coursePar = tmpTotalPar
                            rt.totalStrokes = tmpTotalStrokes
                            rt.courseSlope = Int(tmpCourseSlope)!
                            rt.courseRating = Int(tmpCourseRating)!
                            rt.numHoles = 9
                            rt.courseName = course.name ?? "Course Not Available"
                            
                            courseVM.allRounds.append(rt)
            
                            showAlert = true
                        }label: {
                            Text("Click to Confirm Score and Finish Round")
                                .bold()
                                .padding(.all, 30.0)
                                .background(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                                .foregroundColor(Color.black)
                                .cornerRadius(20)
                                .alert(isPresented: $showAlert) {
                                      Alert(title: Text("Round Complete"),message: Text("View your score on the scoreboard!"))
                                }
                        }
                    }else{
                        Button{
                            
                            
                            tmpRoundPlayed.append(Hole(holeNum: tmpHole, par: tmpPar, strokes: tmpStrokes))
                            tmpHole = tmpHole + 1
                            tmpPar = 3
                            tmpStrokes = 1
                            
                            
                        }label: {
                            Text("Confirm Score")
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
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
       
    }
}
