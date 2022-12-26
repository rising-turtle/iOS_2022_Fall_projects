//
//  ViewModel.swift
//  GolfApp
//
//  Created by Tyler Fontana on 11/13/22.
//
import Foundation
import SwiftUI
import CoreLocation
import MapKit

class ViewModel : NSObject, CLLocationManagerDelegate, ObservableObject{
    
    var locationManager = CLLocationManager()

    @Published var authorizationStatus = CLAuthorizationStatus.notDetermined
    
    @Published var golf = [Business]()
    @Published var countryclubs = [Business]()
    @Published var allRounds = [RoundTotal]()
    
    override init() {
        
        // Init method of NSObject
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // We don't have permission
        }
        
        
        //update authroization status
        self.authorizationStatus = locationManager.authorizationStatus
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let usrLocation = locations.first{
            
            
            getBusiness(category: Constants.countryclubsKey, location: usrLocation)
            getBusiness(category: Constants.golfKey, location: usrLocation)
            
            
            locationManager.stopUpdatingLocation()

            
            
        }
        
        
    }
    
    func getBusiness(category: String, location: CLLocation){
        
    
        var urlComponent = URLComponents(string: Constants.apiURL)
        urlComponent?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "50")
            
        ]
        
        let url = urlComponent?.url
        
        
        
        //Create url session
        if let url = url{
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET" //post delete
            
            //Set HTTP header
            
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            
            let session = URLSession.shared
            
            
            //Create data task
            let dataTask = session.dataTask(with: request){(data, response, error) in
                if error == nil{
                    
                    //parse the json file from yelp api
                    
                    do{
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BussinessSearch.self, from: data!)
                        
                        var businesses = result.businesses
                        businesses.sort{ (b1,b2)-> Bool in
                                    return b1.distance ?? 0 < b2.distance ?? 0//changed to > was <
                        }
                        
                        for b in businesses {
                            b.getImageData()
                        }
                        
                        DispatchQueue.main.async {
                            switch category{
                            case Constants.golfKey:
                                self.golf = businesses // result.businesses
                            case Constants.countryclubsKey:
                                self.countryclubs = businesses //result.businesses
                            default:
                                break
                            }
                        }

                        
                    }catch{
                        print("error")
                    }
                }
                
            }
            
            //Start data task
            
            dataTask.resume()
            
            
        }
        
        
    }
}

    
