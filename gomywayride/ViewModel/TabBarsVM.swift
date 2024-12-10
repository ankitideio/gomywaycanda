//
//  TabBarsVM.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 23/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
class TabBarsVM{
    
func getAllNotificationsApi(token:String,onSuccess:@escaping(([NotificationData?])->())){
    
    let param:parameters = ["token":token]
    WebService.service(API.getAllNotfications,param: param,service: .post) {
        
        (model:AllNotificationsModel,jsonData,jsonSer) in
        
        onSuccess(model.data)
    }
}
    func getAllChatListApi(token:String,onSuccess:@escaping(([GetChatData?])->())){
        
        let param:parameters = ["token":token]
        WebService.service(API.getAllChatList,param: param,service: .post) {
            
            (model:AllChatModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func getRecentTripApi(onSuccess:@escaping(([RecentTripData]?)->())){
        
        let param:parameters = ["token":fethToken(),"type":"recent"]
        
        WebService.service(API.UpcomingAndRecentTripApi,param: param,service: .post) {
            
            (model:RecentTripModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func getUpComingTripApi(onSuccess:@escaping(([RecentTripData]?)->())){
        
        let param:parameters = ["token":fethToken(),"type":"upcoming"]
        
        WebService.service(API.UpcomingAndRecentTripApi,param: param,service: .post) {
            
            (model:RecentTripModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func myRideApi(onSuccess:@escaping(([RecentTripData]?)->())){
        
        let param:parameters = ["token":fethToken(),"type":"upcoming"]
        
        WebService.service(API.myRideApi,param: param,service: .post) {
            
            (model:RecentTripModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func myRideApiRecent(onSuccess:@escaping(([RecentTripData]?)->())){
        
        let param:parameters = ["token":fethToken(),"type":"recent"]
        
        WebService.service(API.myRideApi,param: param,service: .post) {
            
            (model:RecentTripModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func getAllChatListApi(token:String,onSuccess:@escaping(([GetChatData]?)->())){
        let param:parameters = ["token":token]
        WebService.service(API.getAllChatList,param: param,service: .post) {
          (model:AllChatModel,jsonData,jsonSer) in
          onSuccess(model.data )
        }
      }
      func getChatApi(token:String,conversation_id:String,onSuccess:@escaping(([ChatInbox]?)->())){
        let param:parameters = ["token":token,"conversation_id":conversation_id]
        WebService.service(API.getChat,param: param,service: .post) {
          (model:ChatInboxModel,jsonData,jsonSer) in
          onSuccess(model.data )
        }
      }
      func sendMessageApi(token:String,conversation_id:String,message:String,from_id:String,to_id:String,onSuccess:@escaping(()->())){
        let param:parameters = ["token":token,"conversation_id":conversation_id,"message":message,"from_id":from_id,"to_id":to_id]
        WebService.service(API.sendMesageApi,param: param,service: .post,showHud: false) {
          (model:SendMessageModel,jsonData,jsonSer) in
          onSuccess()
        }
      }
}

