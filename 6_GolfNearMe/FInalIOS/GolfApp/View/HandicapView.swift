//
//  HandicapView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/12/22.
//

import SwiftUI

func calculateHI(VM: ViewModel) -> Double{
    var hd = [Double]()
    //ForEach($VM.rounds){ $round in

    for round in VM.allRounds{
        if(round.courseSlope != 0){
            hd.append(Double((round.totalStrokes-round.courseRating)*113/round.courseSlope))
        }else{
            hd.append(0.0)
        }
        
    }
    
    hd.sort()
    var hi = 0.0
    if hd.first != nil{
        for h in hd{
            hi = hi + h
        }
        hi = hi/Double(hd.count) * 0.96
    }else{
        hi = 0.0
    }
    
    return (hi)
}

func courseName(VM: ViewModel) -> [String]{

    var courseName = [String]()
    for round in VM.allRounds{
        if !courseName.contains(round.courseName){
            courseName.append(round.courseName)
        }
    }

    return courseName
}

func courseHandicap(hi: Double, VM: ViewModel) -> [Double]{
    print("hi: \(hi)")
    var courseName = [String]()
    var courseHandicaps = [Double]()
    
    for round in VM.allRounds{
        if !courseName.contains(round.courseName){
            courseName.append(round.courseName)
            print("ch: \((hi*Double(round.courseSlope))/113)")
            courseHandicaps.append((hi*Double(round.courseSlope))/113)
        } else {
            print("ch: \((hi*Double(round.courseSlope))/113)")
            let i = courseName.firstIndex(of: round.courseName)
            courseHandicaps[i ?? 0] = (hi*Double(round.courseSlope))/113
        }
    }
    
    return courseHandicaps
}


struct HandicapView: View {
    
    @EnvironmentObject var VM : ViewModel

    var body: some View {
        ZStack{
            Color(red: 182/255, green: 228/255, blue: 191/255, opacity: 0.70).ignoresSafeArea()
            VStack{
                let hi = calculateHI(VM: VM)
                let ch = courseHandicap(hi: hi.rounded(.down), VM: VM)
                let cn = courseName(VM: VM)
                
                
                Text("Total Handicap Index: \(hi.formatted())")
                    .font(.title)
                    .bold()
                
                ScrollView{
                    if cn.count != 0{
                        ForEach(0...cn.count-1, id: \.self){ i in
                            ZStack{
                                RectangleBKView(height: 80)
                                VStack{
                                        HStack{
                                            Text("\(cn[i]) ")
                                                .bold()
                                            Text("Course Handicap: \(Int(ch[i].rounded()))")
                                                .font(.caption)
                                                .bold()
                                        }//.padding()
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

