//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by Sergei Kriukov on 30.05.2022.
//

import Foundation
import CoreLocation
class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    
    var locationManager = CLLocationManager()
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
   override init() {
       super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
        
      
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if  locationManager.authorizationStatus == .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied {
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.first
        if userLocation != nil {
            locationManager.stopUpdatingLocation()
            getBusineses(category: Constants.sightsKey, location: userLocation!)
            getBusineses(category: Constants.restaurantsKey, location: userLocation!)
            
        }
        
        
       
    }
    func getBusineses(category:String, location:CLLocation) {
/*
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        let url = URL(string: urlString)
*/
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: "40.730610"),
        URLQueryItem(name: "longitude", value: "-73.935242"),
        URLQueryItem(name: "categories", value: category),
                     URLQueryItem(name: "limit", value: "6")
        ]
        let url = urlComponents?.url
        if let url = url {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                if error == nil {
                
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            if category == Constants.sightsKey {
                                self.sights = result.businesses
                                
                            } else if category == Constants.restaurantsKey {
                                self.restaurants = result.businesses
                            }
                        }
                       
                        
                    } catch {
                        print(error)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
