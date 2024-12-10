//
//  AuthVM.swift
//  GomywayCanada
//
//  Created by meet sharma on 19/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation


class AuthVM{
    func apiLogin(email:String,password:String,onSuccess:@escaping((AuthData?)->())){
        let param:parameters = ["username":email,"password":password,"device_token": "Null"]
        WebService.service(API.loginApi,param: param,service: .post) { (model:AuthModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func termApi(onSuccess:@escaping((TermData?)->())){
      
        WebService.service(API.getTermApi,service: .post) { (model:TermsModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func privacyApi(onSuccess:@escaping((TermData?)->())){
      
        WebService.service(API.getPrivacyApi,service: .post) { (model:TermsModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func apiSignup(profilePhoto:Data,idPhoto:Data,email:String,userName:String,password:String,termAndCondition:String,firstName:String,lastName:String,dateOfBirth:String,gender:String,userType:String,confirmPassword:String,onSuccess:@escaping((AuthData?)->())){
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.fullDate.rawValue
        let date = formatter.string(from: Date())
        let imageInfo : ImageStructInfo
        imageInfo = ImageStructInfo.init(fileName: "Img\(date).jpeg", type: "jpeg", data: profilePhoto, key: "profile_photo")
        let imageInfoId : ImageStructInfo
        imageInfoId = ImageStructInfo.init(fileName: "Img\(date).jpeg", type: "jpeg", data: idPhoto, key: "id_photo")
        let param:parameters = ["username":userName,"password":password,"email":email,"terms_and_conditions":termAndCondition,"first_name":firstName,"last_name":lastName,
                     "date_of_birth": dateOfBirth,"gender": gender,"user_type": userType,"confirm_password":confirmPassword,"profile_photo":imageInfo,"id_photo":imageInfoId]
        WebService.service(API.signUpApi,param: param,service: .post) { (model:AuthModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func forgotPasswordApi(email:String,onSuccess:@escaping((ForgotModel?)->())){
        let param:parameters = ["email":email]
        WebService.service(API.forgotPassword,param: param,service: .post) { (model:ForgotModel,jsonData,jsonSer) in
            
            onSuccess(model)
        }
    }
    func logOutApi(id:String,onSuccess:@escaping((AuthModel?)->())){
        let param:parameters = ["id":id]
        WebService.service(API.logoutAPI,param: param,service: .post) { (model:AuthModel,jsonData,jsonSer) in
            
            onSuccess(model)
        }
    }
    func deleteAccountApi(token:String,onSuccess:@escaping((AuthModel?)->())){
        let param:parameters = ["token":token]
        WebService.service(API.deleteAccountApi,param: param,service: .post) { (model:AuthModel,jsonData,jsonSer) in
            
            onSuccess(model)
        }
    }
    func emailVerificationApi(token:String,onSuccess:@escaping((AuthData?)->())){
        let param:parameters = ["token":token]
        WebService.service(API.emailStatusApi,param: param,service: .post,showHud: false) { (model:AuthModel,jsonData,jsonSer) in
            
            onSuccess(model.data)
        }
    }
    func mobileVerificationApi(mobile:String,token:String,onSuccess:@escaping((ForgotModel?)->())){
        let param:parameters = ["mobile": mobile,"token": token]
        WebService.service(API.verifyNumberApi,param: param,service: .post) { (model:ForgotModel,jsonData,jsonSer) in
            
            onSuccess(model)
        }
    }
    func otpVerification(otp:String,token:String,onSuccess:@escaping((ForgotModel?)->())){
        let param:parameters = ["code":otp,"token": token]
        WebService.service(API.verifyOtp,param: param,service: .post,is_raw_form: false) { (model:ForgotModel,jsonData,jsonSer) in
            onSuccess(model)
        }
    }
    func resendOtpVerification(token:String,onSuccess:@escaping((CommonModel?)->())){
        let param:parameters = ["token": token]
        WebService.service(API.resendOtp,param: param,service: .post,is_raw_form: false) { (model:CommonModel,jsonData,jsonSer) in
            onSuccess(model)
        }
    }
   
}


