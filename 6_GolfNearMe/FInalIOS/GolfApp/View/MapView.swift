//
//  MapView.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/15/22.
//

import SwiftUI
import MapKit


struct MyView: UIViewRepresentable{
    
    var course: Business
    
    var region : MKCoordinateRegion{
        get{
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: course.coordinates?.latitude ?? 0.0, longitude: course.coordinates?.longitude ?? 0.0), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
    
    var point_of_interest: [MKPointAnnotation] {
        
        var locs = [MKPointAnnotation]()
        let loc = MKPointAnnotation()
        loc.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = course.name
        
        locs.append(loc)
        return locs
    }
    // create
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        return map
    }
    
    // update
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(point_of_interest)
        uiView.setRegion(region, animated: true)
    }
    
    // tear down
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
}


struct MapView: View {
       
    var course : Business
    var body: some View{
        MyView(course: course).ignoresSafeArea()
    }
}
