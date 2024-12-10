//
//  LocConverter.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 26/11/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import Foundation
import CoreLocation

import SwiftyJSON
func GeocoderFetchPlaceInfor(addressStr:String,sucess:@escaping(NSDictionary) ->Void , failure:@escaping(Error) -> Void) {
    
    print(addressStr)
    
    let escapedString = addressStr.addingPercentEncoding(withAllowedCharacters: .whitespaces)
    
    print(escapedString)
    
    let GeoCoder = CLGeocoder()
    
    GeoCoder.geocodeAddressString(escapedString!) { (placemarks, error) in
        
        if ((error) != nil)
        {
            print(error?.localizedDescription)
            //failure(error!)
            
            let locMutdict = NSMutableDictionary()
            var finalDict = NSDictionary()
            
            locMutdict.setValue(9.5532358, forKey: "latitude")
            locMutdict.setValue(8.074850100000001, forKey: "longitude")
            locMutdict.setValue("Nigeria", forKey: "placeName")
            finalDict = locMutdict.mutableCopy() as! NSDictionary
            sucess(finalDict)
        }
        else
        {
            
            print(sucess)
            
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
           
            let locMutdict = NSMutableDictionary()
            var finalDict = NSDictionary()
            
            locMutdict.setValue((placeMark.location?.coordinate.latitude)!, forKey: "latitude")
            locMutdict.setValue((placeMark.location?.coordinate.longitude)!, forKey: "longitude")
            locMutdict.setValue(addressStr, forKey: "placeName")
            finalDict = locMutdict.mutableCopy() as! NSDictionary
            sucess(finalDict)

        }
    }
    
    
}


func getAddress(addressStr: String, success: @escaping (NSDictionary) -> Void, failure: @escaping (Error) -> Void) {
    let key: String = KGoogleApi_Key
    let urlStr = "https://maps.googleapis.com/maps/api/geocode/json"
    
    guard var components = URLComponents(string: urlStr) else {
        // Handle URL component creation error
        return
    }

    let queryItems = [
        URLQueryItem(name: "address", value: addressStr),
        URLQueryItem(name: "key", value: key)
    ]
    components.queryItems = queryItems

    guard let url = components.url else {
        // Handle URL creation error
        return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            failure(error)
            return
        }

        if let data = data {
            do {
                if let resultParams = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let status = resultParams["status"] as? String,
                   let results = resultParams["results"] as? [[String: Any]],
                   let geometry = results.first?["geometry"] as? [String: Any],
                   let location = geometry["location"] as? [String: Any],
                   let latitude = location["lat"] as? Double,
                   let longitude = location["lng"] as? Double {
                    var locMutdict = NSMutableDictionary()
                    locMutdict.setValue(latitude, forKey: "latitude")
                    locMutdict.setValue(longitude, forKey: "longitude")
                    locMutdict.setValue(addressStr, forKey: "placeName")
                    let finalDict = locMutdict.mutableCopy() as! NSDictionary
                    success(finalDict)
                } else {
                    // Handle the "status" not equal to "OK" case or other parsing issues
                }
            } catch {
                failure(error)
            }
        }
    }
    task.resume()
}
