//
//  CourseSection.swift
//  GolfApp
//
//  Created by Tyler Fontana on 12/6/22.
//


import SwiftUI


    struct CourseSectionHeader : View{
        
        var title: String
        
        var body : some  View{
            ZStack{
                Rectangle().foregroundColor(Color(red: 250/255,green: 250/255 , blue: 210/255, opacity: 1))
                Text(title)
                    .font(.body.bold())
                    .foregroundColor(.black)
                    
                    
                    
            }
        }
        
    }

    struct CourseSection: View {
        
        var title : String
        
        var courses: [Business]
        
        var body: some View {
            Section(header: CourseSectionHeader(title: title)){
                ForEach(courses){ c in
                    
                    NavigationLink{
                        CourseViewOptions(course: c)
                    }label: {
                        CourseRow(course: c)
                    }
                    
                }
            }
        }
    }

 

