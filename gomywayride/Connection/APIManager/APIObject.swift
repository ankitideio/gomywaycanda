//
//  APIObject.swift
//  ideeleePlus
//
//  Created by Snow-Macmini-1 on 04/07/19.
//  Copyright © 2019 Snow-Macmini-2. All rights reserved.
//

import Foundation

let baseUrl = "https://gomyway.ca/"

var loginApi_endpoint = "api/authenticate/login"
var resgisterApi_endpoint = "api/authenticate/register"
var forgotPassApi_endpoint = "api/Apidata/forgot-password"
var verifyNumber_endpoint = "api/Apidata/verify-mobile-code"
var verifyCode_endpoint = "api/Apidata/confirm-code"
var resendOtp_endpoint = "api/Apidata/resend-verification"
var emailStatus_endpoint = "api/Apidata/email-status"

var apiGetStates = "api/Apidata/get-states"
var logoutAPI_endpoint = "api/authenticate/logout"
var helpApi_endpoint = "api/Apidata/get-help-content"
var aboutApi_endpoint = "api/Apidata/get-about"
var profileDetailApi_endPoint = "api/Apidata/user-detail"
var getVehicalApi_Enpoint = "api/Apidata/get-user-vehicle"
var getVehicleTypesApi_endpoint = "api/Apidata/get-vehicles"
var addVehicleApi_endpoint = "api/Apidata/add-user-vehicle"
var deleteVehcleApi_endpoint = "api/Apidata/delete-vehicle"
var updatePrfileAPi_endpoint = "api/Apidata/update-user-profile"
var getReferCodeAPI_endpoint = "api/Apidata/get-refer-code"
var couponsAPI_endpoint = "api/Apidata/get-promo-codes"
var referedUsersAPI_endpoint = "api/Apidata/get-refered-users"
var paymentAPI_endpoint = "api/Apidata/payments"
var cardDetailsApi_endpoint = "api/Apidata/get-bank-detail"
var AddCardAPi_endpoint = "api/Apidata/add-bank-detail"
var deleteCardAPi_endpoint = "api/Apidata/delete-bank-detail"
var getNotificationApi_endpoint = "api/Apidata/get-notification-settings"
var saveNotificationApi_endpint = "api/Apidata/save-notification-settings"
var saveIdentityApi_endPoint = "api/Apidata/save-user-identity"
var getIdenetityAPI_endpoint = "api/Apidata/get-user-identity"
var getUserEmailApi_endpoint = "api/Apidata/get-user-emails"
var saveUserEmailApi_endpoint = "api/Apidata/save-user-email"
var deleteEmailApi_endpoint = "api/Apidata/action-email"
var PrimaryEmailApi_endpoint = "api/Apidata/action-email"
var reSendEmailApi_endpoint = "api/Apidata/action-email"
var bankListApi_endpoint = "api/Apidata/get-bank-names"
var addBankDetailApi_endpoint = "api/Apidata/add-bank-detail"
var getBankDetailApi_endpoint = "api/Apidata/get-bank-detail"
var getPaymentApi_endpoint = "api/Apidata/payments"
var walletEarningApi_endpoint = "api/Apidata/get-wallet-listing"
var deleteAccountApi_endpoint = "api/Apidata/accountDelete"
var getTermApi_endpoint = "api/Apidata/get-terms"
var getPrivacyApi_endpoint = "api/Apidata/privacyPolicy"

///TripAPi_Endpoint

var getTripStatus_Api_Endpoint = "api/Apidata/getpost-trip-status"
var UpcomingTripApi_endpoint = "api/Apidata/get-trips"
var recentTripApi_endpoint = "api/Apidata/get-trips"
var TripDetailsApi_endpoint = "api/Apidata/view-post-trip"
var closeTripAPI_Endpoint = "api/Apidata/close-trip"
var CancelTripAPI_endpoint = "api/Apidata/cancel-trip"
var TripCompleteAPi_endpoint = "api/Apidata/complete-trip"

///PassengerApiS

var getSavedLocationApi_endPoint = "api/Apidata/get-recent-search"
var searchResultApi_endPoint = "api/Apidata/search-ride"
var passengerUpcomingApi_endpoint = "api/Apidata/passenger-rides"
var passengerRecentAPi_endpoint = "api/Apidata/passenger-rides"
var passengerRideDetails_Api_Endpoint = "api/Apidata/get-ride-detail"
var cancelRide_Api_endpoint = "api/Apidata/cancel-ride"
var reviewApi_endpoint = "api/Apidata/submit-review"
var getAllNotfications_api_endpoint = "api/Apidata/get-all-notifications"
var getInboxApi_endpoint = "api/Apidata/get-user-inbox"
var getChatMessageApi_endpoint = "api/Apidata/get-chat"
var sendMesageApi_endpoint = "api/Apidata/save-chat"


//POSTTripWebViewUrls

//var POST_TRIP_URL = "https://gomyway.ca/api/Apidata/post-trip?token="
var POST_TRIP_URL = "https://gomyway.ca/api/Apidata/postingRules?token="
var TRIP_SUBMIT_SUCCESSFULLY = "https://gomyway.ca/?token="
var Request_Recived_url = "https://gomyway.ca/api/Apidata/get-trip-requests?token="
var EDIT_POST_TRIP_URL = "https://gomyway.ca/api/Apidata/edit-post-trip?token="
var SEARCHED_TRIP_DETAILS = "https://gomyway.ca/api/Apidata/search-trip-SingleDetail?token="

//https://gomywayride.com/api/Apidata/congrats?token=


// MARK NEWPIS:-

var postARequestAPI = "api/Apidata/post-a-request"
