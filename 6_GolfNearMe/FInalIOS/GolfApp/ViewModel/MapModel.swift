//
//  ViewModel.swift
//  LocationApp
//
//  Created by Tyler Fontana on 11/11/22.
//

import Foundation

import CoreLocation

class MapModel : NSObject, CLLocationManagerDelegate, ObservableObject{
    
    
    var locationManager = CLLocationManager()
    
    @Published var userLat : Double = 0.0
    @Published var usrLon : Double = 0.0
    
    override init(){
        
        //init is parent
        super.init()
        
        //create delegate
        locationManager.delegate = self
        
        // request permission to the user
        locationManager.requestWhenInUseAuthorization()
                
           
        
    }
    
    
    //Mark location manager delegate methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            print("ya we have permission kings")
            
            locationManager.startUpdatingLocation()
            
            
        }else if locationManager.authorizationStatus == .denied{
            print("didnt pass the vibe check sorry fam")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print(locations.first ?? "no location")
        
        if let usrLocation = locations.first{
            self.userLat = usrLocation.coordinate.latitude
            self.usrLon = usrLocation.coordinate.longitude
        }
    }
    
    
}
