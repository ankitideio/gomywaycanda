//
//  FindTripVM.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 25/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation

class FindTripVM{
    func searchTripApi(token:String,onSuccess:@escaping(([GetChatData?])->())){
        
        let param:parameters = ["token":token]
        WebService.service(API.getSavedLocationApi,param: param,service: .post) {
            
            (model:AllChatModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func tripDetailApi(token:String,Trip_Id:String,onSuccess:@escaping((TripDetailData?)->())){
        
        let param:parameters = ["token":token,"tripId":Trip_Id]
        WebService.service(API.tripDetailApi,param: param,service: .post) {
            
            (model:TripDetailModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func getTripRequestStatusApi(token:String,tripId:String,onSuccess:@escaping((TripDetailData?)->())){
        
        let param:parameters = ["token":token,"tripId":tripId]
        WebService.service(API.tripDetailApi,param: param,service: .post) {
            
            (model:TripDetailModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func findTripApi(token:String,onSuccess:@escaping((TripDetailData?)->())){
        
        let param:parameters = ["token":token]
        WebService.service(API.getSavedLocationApi,param: param,service: .post) {
            
            (model:TripDetailModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func cancelTripApi(token:String,tripId:String,trip_status:String,onSuccess:@escaping((TripDetailData?)->())){
        
        let param:parameters = ["token":token,"tripId":tripId,"trip_status":trip_status]
        WebService.service(API.CancelTripAPI,param: param,service: .post) {
            
            (model:TripDetailModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func completeTripApi(token:String,tripId:String,trip_status:String,onSuccess:@escaping((TripDetailData?)->())){
        
        let param:parameters = ["token":token,"tripId":tripId,"trip_status":trip_status]
        print(param)
        WebService.service(API.TripCompleteAPi,param: param,service: .post) {
          
            (model:TripDetailModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func closeTripApi(token:String,tripId:String,trip_status:String,onSuccess:@escaping((TripDetailData?)->())){
        
        let param:parameters = ["token":token,"tripId":tripId,"trip_status":trip_status]
        WebService.service(API.closeTripAPI,param: param,service: .post) {
            
            (model:TripDetailModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
}
