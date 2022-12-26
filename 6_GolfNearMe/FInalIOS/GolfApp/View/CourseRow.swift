//
//  CourseRow.swift
//
//  Created by Tyler Fontana on 12/2/22.
//

import SwiftUI

struct CourseRow: View {
    
    @ObservedObject var course : Business
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                
                //image
                let uiImage = UIImage(data: course.urlImageData ?? Data())
                if uiImage?.pngData() == nil {
                    Image("noimage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(10)
                        .padding(.leading)
                }else{
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .cornerRadius(10)
                        .padding(.leading)
                }
                
                
                //name and distance
                VStack(alignment: .leading){
                    
                    Text(course.name ?? "")
                        .bold()
                        .foregroundColor(.black)
                    Text(String(format: "%.2f mi away", (course.distance ?? 0.0)/1609)).foregroundColor(.black)
                        
                }
                
                Spacer()
                
                //rating
                
                VStack(alignment: .leading){
                    Image("regular_\(course.rating ?? 0.0)")
                    Text("\(course.review_count ?? 0) Reviews").foregroundColor(.black)
                }.padding(.trailing)
                
            }
            Divider()
            
        }
    }
}
