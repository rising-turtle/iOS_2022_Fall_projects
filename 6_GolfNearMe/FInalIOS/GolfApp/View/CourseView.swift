//
//  CourseView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/12/22.
//

import SwiftUI
import Combine
import MapKit
import CoreLocation

//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private let manager = CLLocationManager()
//    var lastKnownLocation: CLLocation?
//
//    func startUpdating() {
//        manager.delegate = self
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
//        lastKnownLocation = locations.last
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            manager.startUpdatingLocation()
//        }
//    }
//}
//
//



struct CourseView: View {
    
    //@State var LM : LocationManager

    @ObservedObject var MM : MapModel
    
    @EnvironmentObject var courseVM : ViewModel
    
//    func distanceFromCourse(course: Course)-> Double{
//
//        let coordinate1 = CLLocation(latitude: course.latitude, longitude: course.longitude)
//        let coordinate2 = CLLocation(latitude: MM.userLat, longitude: MM.usrLon)
//
//        let distanceInMeters = coordinate1.distance(from: coordinate2)
//
//        return distanceInMeters
//    }
    
    var body: some View {
        
        
        NavigationView{
            ScrollView{
                
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){
                    
                    CourseSection(title: "Country Clubs", courses: courseVM.countryclubs)
                    CourseSection(title: "Public Courses + More", courses: courseVM.golf)
                }
                    
                
            }.navigationTitle("Golf Near Me")
                .background(Color(red: 182/255, green: 228/255, blue: 191/255, opacity: 0.70))
                
        }.accentColor(.black)
    }
}
