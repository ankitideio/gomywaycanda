//
//  Constant.swift
//  GomywayCanada
//
//  Created by meet sharma on 19/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
import UIKit


//MARK: - URL + KEYS

let baseURL = "https://gomyway.ca/"

public typealias parameters = [String:Any]

var noInternetConnection = "No Internet Connection Available"
var appName = "GomywayCanada"


//MARK: - STORE FILE
enum DefaultKeys: String{
    case authKey
    case userDetails
    case autoLogin
    case deviceToken
    case Authorization
    case fullName
    case userDetail
    case updateUserDetail
    case emailStatus
    case userProfileStatus
}


//MARK: API - SERVICES
enum Services: String
{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

//MARK: API - ENUM
enum API: String
{
    //MARK: API - USER
    case loginApi = "api/authenticate/login"
    case signUpApi = "api/authenticate/register"
    case forgotPassword = "api/Apidata/forgot-password"
//    case verifyPhone = "api/Apidata/verify-mobile-code"
   
    case apiGetStates = "api/Apidata/get-states"
    case getUserEmail = "api/Apidata/get-user-emails"
    case updateProfile = "api/Apidata/update-user-profile"
    case addVehicle = "api/Apidata/add-user-vehicle"
    case getVehicle = "api/Apidata/get-user-vehicle"
    case getVehicleTypesApi = "api/Apidata/get-vehicles"
    case profileDetailApi = "api/Apidata/user-detail"
    case getAllNotfications = "api/Apidata/get-all-notifications"
    case getAllChatList = "api/Apidata/get-user-inbox"
    case UpcomingAndRecentTripApi = "api/Apidata/get-trips"
    case aboutApi = "api/Apidata/get-about"
    case getPaymentApi = "api/Apidata/payments"
    case getIdenetityApi = "api/Apidata/get-user-identity"
    case myRideApi = "api/Apidata/passenger-rides"
    case deleteEmailApi = "api/Apidata/action-email"
    case tripDetailApi =  "api/Apidata/view-post-trip" 
                        
    case resendOtp = "api/Apidata/resend-verification"
    case logoutAPI = "api/authenticate/logout"
    case deleteAccountApi = "api/Apidata/accountDelete"
    case emailStatusApi = "api/Apidata/email-status"
    case verifyNumberApi = "api/Apidata/verify-mobile-code"
    case verifyOtp = "api/Apidata/confirm-code"
    case saveIdentityApi = "api/Apidata/save-user-identity"
    case getTermApi = "api/Apidata/get-terms"
    case getPrivacyApi = "api/Apidata/privacyPolicy"
    case deleteVehcleApi = "api/Apidata/delete-vehicle"
    case CancelTripAPI = "api/Apidata/cancel-trip"
    case closeTripAPI = "api/Apidata/close-trip"
    case TripCompleteAPi = "api/Apidata/complete-trip"
    case getReferCodeApi = "api/Apidata/get-refer-code"
   // 27Oct,friday
    case searchResultApi = "api/Apidata/search-ride"
    case getSavedLocationApi = "api/Apidata/get-recent-search"
    case saveUserEmailApi = "api/Apidata/save-user-email"
    case postRequest = "api/Apidata/post-a-request"
    case post_Trip_URL = "https://gomyway.ca/api/Apidata/postingRules?token="
    case trip_Submit_Successfully = "https://gomyway.ca/?token="
    case Request_Recived_url = "https://gomyway.ca/api/Apidata/get-trip-requests?token="
    case edit_Post_Trip_Url = "https://gomyway.ca/api/Apidata/edit-post-trip?token="
    case search_Trip_Detail = "https://gomyway.ca/api/Apidata/search-trip-SingleDetail?token="

    case getChat = "api/Apidata/get-chat"

    case sendMesageApi = "api/Apidata/save-chat"
    case helpApi = "api/Apidata/get-help-content"
}
enum dateFormat: String {
    case fullDate = "MM_dd_yy_HH:mm:ss.SS"
    case DateAndTime = "dd/M/yyyy hh:mm a"
   
}

enum constantMessages:String{
    
    case internetError = "Please check your internet connectivity"

    var instance : String {
        return self.rawValue
    }
}
