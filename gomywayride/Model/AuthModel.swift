//
//  AuthModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 19/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation

// MARK: - AuthModel
struct AuthModel: Codable {
    let message: String?
    let status: Bool?
    let token: String?
    let data: AuthData?
}

// MARK: - DataClass
struct AuthData: Codable {
    let upcomingTrips: [UpcomingTrip]?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case upcomingTrips = "upcoming_trips"
        case user
    }
}

// MARK: - UpcomingTrip
struct UpcomingTrip: Codable {
    let availableSeats, backRowSeating, bookingPreference: String?
    let createdAt: String?
    let deletedAt: String?
    let description, destination: String?
    let driverID: String?
    let eventID: String?
    let firstName: String?
    let id: String?
    let lastName: String?
    let leaving: String?
    let luggage: String?
    let origin, others: String?
    let pricePerSeat: String?
    let profileURL: String?
    let returning: String?
    let totalSeats, tripID, tripStatus, tripType: String?
    let updatedAt: String?
    let userVehicleID: String?
    let username: String?
    let views: String?

    enum CodingKeys: String, CodingKey {
        case availableSeats = "available_seats"
        case backRowSeating = "back_row_seating"
        case bookingPreference = "booking_preference"
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case description, destination
        case driverID = "driver_id"
        case eventID = "event_id"
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case leaving, luggage, origin, others
        case pricePerSeat = "price_per_seat"
        case profileURL = "profile_url"
        case returning
        case totalSeats = "total_seats"
        case tripID = "trip_id"
        case tripStatus = "trip_status"
        case tripType = "trip_type"
        case updatedAt = "updated_at"
        case userVehicleID = "user_vehicle_id"
        case username, views
    }
}



// MARK: - User
struct User: Codable {
    let aboutUser: String?
    let accountNumber: String?
    let address: String?
    let age, avgRating: Int?
    let bankAccountID: String?
    let bankCode, bankName, bankUserName, cityName: String?
    let created: String?
    let customerID: String?
    let date_of_birth: String?
    let deviceToken, deviceTokenIos: String?
    let driverSuspendedOn, email: String?
    let emailStatus: String?
    let firstName: String?
    let forgotPasswordLink, forgotPasswordLinkTime: String?
    let gender: String?
    let govermentIssuedID: String?
    let houseNumber, id: String?
    let joined: String?
    let lastName: String?
    let latitude, locale: String?
    let loginStatus: String?
    let longitude: String?
    let mobile, mobileStatus: String?
    let modified: String?
    let numberOfReviews: Int?
    let oauthProvider: String?
    let oauthUid: String?
    let password: String?
    let paystackSecret: String?
    let profileImage: String?
    let profileStatus: String?
    let profileURL: String?
    let referCode, stateName, streetName, token: String?
    let userType: String?
    let username: String?
    let uuid, verificationCode: String?
    let verificationCodeMobile: String?
    let zipcode: String?

    enum CodingKeys: String, CodingKey {
        case aboutUser = "about_user"
        case accountNumber = "account_number"
        case address, age, avgRating
        case bankAccountID = "bankAccountId"
        case bankCode = "bank_code"
        case bankName = "bank_name"
        case bankUserName = "bank_user_name"
        case cityName = "city_name"
        case created
        case customerID = "customerId"
        case date_of_birth = "date_of_birth"
        case deviceToken = "device_token"
        case deviceTokenIos = "device_token_ios"
        case driverSuspendedOn = "driver_suspended_on"
        case email
        case emailStatus = "email_status"
        case firstName = "first_name"
        case forgotPasswordLink = "forgot_password_link"
        case forgotPasswordLinkTime = "forgot_password_link_time"
        case gender
        case govermentIssuedID = "goverment_issued_id"
        case houseNumber = "house_number"
        case id, joined
        case lastName = "last_name"
        case latitude, locale
        case loginStatus = "login_status"
        case longitude, mobile
        case mobileStatus = "mobile_status"
        case modified
        case numberOfReviews = "number_of_reviews"
        case oauthProvider = "oauth_provider"
        case oauthUid = "oauth_uid"
        case password
        case paystackSecret = "paystack_secret"
        case profileImage = "profile_image"
        case profileStatus = "profile_status"
        case profileURL = "profile_url"
        case referCode = "refer_code"
        case stateName = "state_name"
        case streetName = "street_name"
        case token
        case userType = "user_type"
        case username, uuid
        case verificationCode = "verification_code"
        case verificationCodeMobile = "verification_code_mobile"
        case zipcode
    }
}
