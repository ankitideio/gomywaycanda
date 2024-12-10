//
//  SearchRideVM.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 27/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
class SearchRideVM{
    func searchRideApi(token:String,fromTrip:String,toTrip:String,leaving:String,onSuccess:@escaping(([SearchRideData]?)->())){
        
        let param:parameters = ["token":token,"fromTrip":fromTrip,"toTrip":toTrip,"leaving":leaving]
        WebService.service(API.searchResultApi,param: param,service: .post) {
            
            (model:SearchRideModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func getSavedApi(token:String,onSuccess:@escaping(([SearchRideData]?)->())){
        
        let param:parameters = ["token":token]
        WebService.service(API.getSavedLocationApi,param: param,service: .post) {
            
            (model:SearchRideModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
}
