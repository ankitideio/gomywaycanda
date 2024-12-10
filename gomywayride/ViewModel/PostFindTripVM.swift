//
//  PostFindTripVM.swift
//  GomywayCanada
//
//  Created by meet sharma on 26/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation

class PostFindTripVM{
    func postRequestApi(origin:String,destination:String,leaving:String,seat:String,description:String,onSucces:@escaping((PostRequestRideModel?)->())){
        let param:parameters = ["token":fethToken(),"origin":origin,"destination":destination,"leaving":leaving,"seats":seat,"description":description]
        WebService.service(API.postRequest,param: param,service: .post,is_raw_form: false) { (model:PostRequestRideModel,jsonData,jsonSer) in
            onSucces(model)
        }
    }
    
}
