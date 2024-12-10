//
//  MoreDetailsVM.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 20/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
class MoreDetailsVM{
    
    func getReferCodeApi(onSuccess:@escaping((CommonModel?)->())){
        let param:parameters = ["token":fethToken()]
        WebService.service(API.getReferCodeApi,param: param,service: .post,is_raw_form: false) { (model:CommonModel,jsonData,jsonSer) in
            onSuccess(model)
        }
    }
    func stateNameApi(token:String,onSuccess:@escaping(([GetStatesData]?)->())){
        let param:parameters = ["token":token]
        WebService.service(API.apiGetStates,param: param,service: .post,showHud: false) { (model:StateNameModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func getEmailApi(onSuccess:@escaping((EmailDataUser?)->())){
        let param = ["token":fethToken()]
        print(param)
        WebService.service(API.getUserEmail,param: param,service: .post) { (model:GetUserEmailModel,jsonData,jsonSer) in
            Store.emailStatus = model.status ?? false
           
            onSuccess(model.data)
        }
    }
    func deleteEmailApi(email:String,type:String,onSuccess:@escaping(([GetEmailData]?)->())){
        let param = ["token":fethToken(),"type":type,"email":email]
        print(param)
        WebService.service(API.deleteEmailApi,param: param,service: .post) { (model:EmailVerifyModel,jsonData,jsonSer) in
            Store.emailStatus = model.status ?? false
           
            onSuccess(model.data)
        }
    }
    func getProfileApi(status:Bool,onSuccess:@escaping((UserData?)->())){
        let param = ["token":fethToken()]
        print(param)
        WebService.service(API.profileDetailApi,param: param,service: .post,showHud: status) { (model:UserProfileModel,jsonData,jsonSer) in
            Store.userProfileStatus = model.status
            onSuccess(model.data)
        }
    }
    func updateProfiel(profilePhoto:Data,token:String,user_type:String,first_name:String,last_name:String,about_user:String,gender:String,mobile:String,date_of_birth:String,house_number:String,city_name:String,state_name:String,street_name:String,onSuccess:@escaping((AuthData?)->())){
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.fullDate.rawValue
        let date = formatter.string(from: Date())
        let imageInfo : ImageStructInfo
        imageInfo = ImageStructInfo.init(fileName: "Img\(date).jpeg", type: "jpeg", data: profilePhoto, key: "profile_image")
        let param: parameters = ["token":fethToken(),
                      "user_type":user_type,
                     "first_name":first_name,
                     "last_name":last_name,
                     "about_user":about_user,
                     "gender":gender,
                     "mobile":mobile,
                     "date_of_birth":date_of_birth,
                     "house_number":house_number,
                     "city_name":city_name,
                     "state_name":state_name,
                     "street_name":street_name,"profile_image":imageInfo]
        print(param)
        WebService.service(API.updateProfile,param: param,service: .post) { (model:AuthModel,jsonData,jsonSer) in
            
            Store.userDetail = model.data
            showSwiftyAlert("", model.message ?? "", true)
            
            onSuccess(model.data)
        }
    }
    
    func addUserEmailApi(email:String,onSuccess:@escaping(([Email]?)->())){
        let param = ["token":fethToken(),"email":email]
        print(param)
        WebService.service(API.saveUserEmailApi,param: param,service: .post) { (model:AddEmailModel,jsonData,jsonSer) in
            Store.emailStatus = model.status ?? false
           
            onSuccess(model.data)
        }
    }
    func getVehicalsApi(token:String,onSuccess:@escaping((VehicleData?)->())){
        let param = ["token":token]
        print(param)
        WebService.service(API.getVehicle,param: param,service: .post) { (model:VehicleModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func getVehicalTypeApi(token:String,onSuccess:@escaping((AddVehicalData?)->())){
        let param = ["token":token]
        print(param)
        WebService.service(API.getVehicleTypesApi,param: param,service: .post) { (model:AddVehicleModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func getAboutApi(onSuccess:@escaping((AboutData?)->())){
        let param = ["token":fethToken()]
        print(param)
        WebService.service(API.aboutApi,param: param,service: .post) { (model:AboutModel,jsonData,jsonSer) in
            
            
            onSuccess(model.data)
        }
    }
    func helpApi(onSuccess:@escaping(([HelpData]?)->())){
        let param = ["token":fethToken()]
        print(param)
        WebService.service(API.helpApi,param: param,service: .post) { (model:HelpModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func payoutApi(onSuccess:@escaping(([PayOutData]?)->())){
        let param = ["token":fethToken()]
        print(param)
        WebService.service(API.getPaymentApi,param: param,service: .post) { (model:PayOutModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func idVerficationApi(onSuccess:@escaping((IdVerficationData?)->())){
        let param = ["token":fethToken()]
        print(param)
        WebService.service(API.getIdenetityApi,param: param,service: .post) { (model:IdVerficationModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func saveIdentityApi(token:String,first_name_id:String,last_name_id:String,onSuccess:@escaping((IdVerficationData?)->())){
        
        let param = ["token":token,"first_name_id":first_name_id,"last_name_id":last_name_id]
        print(param)
        WebService.service(API.saveIdentityApi,param: param,service: .post) { (model:IdVerficationModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
  
    func addIdVerificationApi(firstNameId:String,lastNameId:String,photoId:Data,onSuccess:@escaping((IdVerficationData?)->())){
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.fullDate.rawValue
        let date = formatter.string(from: Date())
        let imageInfo : ImageStructInfo
        imageInfo = ImageStructInfo.init(fileName: "file.jpeg", type: "image/jpeg", data: photoId, key: "idverify")
        let param:parameters = ["token":fethToken(),"first_name_id":firstNameId,"last_name_id":lastNameId,"idverify":imageInfo]
        WebService.service(API.saveIdentityApi,param: param,service: .post) { (model:IdVerficationModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func resendVerifyApi(token:String,email:String,emailType:String,onSuccess:@escaping(([GetEmailData]?)->())){
        let param:parameters = ["token":token,"type":"verification","email":email,"emailType":emailType]
        print(param)
        WebService.service(API.resendOtp,param: param,service: .post) { (model:EmailVerifyModel,jsonData,jsonSer) in
            showSwiftyAlert("", model.message ?? "", true)
            onSuccess(model.data)
        }
    }
    func addVehicalApi(token:String,vehicle_name:String,vehicle_type:String,model:String,plate_number:String,img:Data,idPhoto:Data,onSuccess:@escaping((VehicleData?)->())){
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.fullDate.rawValue
        let date = formatter.string(from: Date())
        let imageInfo : ImageStructInfo
        imageInfo = ImageStructInfo.init(fileName: "Img\(date).jpeg", type: "jpeg", data: img, key: "userfile[]")
        let imageInfoId : ImageStructInfo
        imageInfoId = ImageStructInfo.init(fileName: "Img\(date).jpeg", type: "jpeg", data: idPhoto, key: "car_insurance")
        
        let param: parameters = ["token":token,
                      "vehicle_name":vehicle_name,
                     "vehicle_type":vehicle_type,
                     "model":model,
                     "plate_number":plate_number,
                      "userfile[]":imageInfo,
                        "car_insurance":imageInfoId
                     ]
        print(param)
        WebService.service(API.addVehicle,param: param,service: .post) { (model:VehicleModel,jsonData,jsonSer) in
            onSuccess(model.data)
            
        }
    }
    func deleteVehicalsApi(token:String,vehicleId:String,onSuccess:@escaping((VehicleData?)->())){
        let param = ["token":token,"vehicleId":vehicleId]
        print(param)
        WebService.service(API.deleteVehcleApi,param: param,service: .post) { (model:VehicleModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
}


