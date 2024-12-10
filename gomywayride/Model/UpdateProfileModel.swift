//
//  UpdateProfileModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 20/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation

struct UpdateProfileModel: Codable {
    let data: GetUserData?
    let status: Bool?
    let message: String?
}

struct GetUserData: Codable {
    let upcomingTrips: [String]? 
    let user: UserDetails?
}

struct UserDetails: Codable {
    let aboutUser: String?
    let accountNumber: String?
    let address: String?
    let age: Int?
    let avgRating: Int?
    let bankAccountId: String?
    let bankCode: String?
    let bankName: String?
    let bankUserName: String?
    let cityName: String?
    let created: String?
    let customerId: String?
    let date_of_birth: String
    let deviceToken: String?
    let deviceTokenIos: String?
    let driverSuspendedOn: String?
    let email: String?
    let emailStatus: Int?
    let firstName: String?
    let forgotPasswordLink: String?
    let forgotPasswordLinkTime: String?
    let gender: String?
    let govermentIssuedId: String?
    let houseNumber: String?
    let id: String?
    let joined: String?
    let lastName: String?
    let latitude: String?
    let locale: String?
    let loginStatus: Int?
    let longitude: String?
    let mobile: String?
    let mobileStatus: Int?
    let modified: String?
    let numberOfReviews: Int?
    let oauthProvider: String?
    let oauthUid: String?
    let password: String?
    let paystackSecret: String?
    let profileImage: String?
    let profileUrl: String?
    let referCode: String?
    let stateName: String?
    let streetName: String?
    let token: String?
    let userType: Int?
    let username: String?
    let uuid: String?
    let verificationCode: String?
    let verificationCodeMobile: Int?
    let zipcode: String?
}
