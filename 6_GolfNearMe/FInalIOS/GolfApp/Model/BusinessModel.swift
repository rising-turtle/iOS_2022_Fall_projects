//
//  BusinessModel.swift
//  GolfApp
//
//  Created by Tyler Fontana on 12/4/22

import Foundation

struct BussinessSearch: Decodable{
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}
struct Region: Decodable{
    var center = Coordinate()
}

struct Coordinate: Decodable{
    var longitude: Double = 0
    var latitude: Double = 0
}

class Business: Decodable, Identifiable, ObservableObject{
    
    //when we decode the data from the json file we fetch the image from the image url
    @Published var urlImageData : Data?
    
    
    var id: String?
    var alias : String?
    var name: String?
    var image_url: String?
    var is_closed: Bool?
    var url : String?
    var review_count : Int?
    var categories : [Category]?
    var rating : Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location : Location?
    var phone: String?
    var display_phone: String?
    var distance : Double?
    
    enum CodingKeys: String, CodingKey{
        case id, alias, name, image_url, is_closed, url, review_count, categories, rating, coordinates, transactions, price, location, phone, display_phone, distance
    }
    
    func getImageData(){
        guard image_url != nil else{
            return
        }
        if let url = URL(string: image_url!){
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url){ data, response, error in
                if error == nil{
                    DispatchQueue.main.async {
                        self.urlImageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
}


struct Category : Decodable {
    
    var alias : String?
    var title : String?
}


struct Location: Decodable{
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city : String?
    var zip_code : String?
    var country: String?
    var state: String?
    var display_address: [String]?
    
}
