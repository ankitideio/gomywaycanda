//
//  EmailVerifyModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 20/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - EmailVerifyModel

struct EmailVerifyModel: Codable {
    let data: [GetEmailData]?
    let message: String?
    let status: Bool?
}

// MARK: - DataClass
struct GetEmailData: Codable {
    let otherEmails: [OtherEmail]?
    let primaryEmail: PrimaryEmail?

    enum CodingKeys: String, CodingKey {
        case otherEmails = "other_emails"
        case primaryEmail = "primary_email"
    }
}

// MARK: - OtherEmail
struct OtherEmail: Codable {
    let email, username, status: String?
    let updatedAt: String?
    let userID, type: String?
    let verificationCode: String?
    let createdAt, id: String?
    let deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case email, username, status
        case updatedAt = "updated_at"
        case userID = "user_id"
        case type
        case verificationCode = "verification_code"
        case createdAt = "created_at"
        case id
        case deletedAt = "deleted_at"
    }
}

// MARK: - PrimaryEmail
struct PrimaryEmail: Codable {
    let profileURL, modified: String?
    let accountNumber, latitude: String?
    let oauthProvider, email, stateName: String?
    let driverSuspendedOn, bankAccountID, forgotPasswordLinkTime: String?
    let created: String?
    let paystackSecret, bankCode, forgotPasswordLink: String?
    let status, userType: String?
    let uuid: String?
    let emailStatus, lastName, streetName: String?
    let deviceTokenIos: String?
    let mobileStatus, zipcode, loginStatus: String?
    let customerID: String?
    let mobile, username: String?
    let oauthUid, bankName: String?
    let password: String?
    let bankUserName: String?
    let gender, houseNumber: String?
    let primaryEmail: Int?
    let referCode, firstName, dateOfBirth: String?
    let locale: String?
    let cityName: String?
    let longitude: String?
    let id, deviceToken: String?
    let address: String?
    let verificationCode, verificationCodeMobile, aboutUser, token: String?

    enum CodingKeys: String, CodingKey {
        case profileURL = "profile_url"
        case modified
        case accountNumber = "account_number"
        case latitude
        case oauthProvider = "oauth_provider"
        case email
        case stateName = "state_name"
        case driverSuspendedOn = "driver_suspended_on"
        case bankAccountID = "bankAccountId"
        case forgotPasswordLinkTime = "forgot_password_link_time"
        case created
        case paystackSecret = "paystack_secret"
        case bankCode = "bank_code"
        case forgotPasswordLink = "forgot_password_link"
        case status
        case userType = "user_type"
        case uuid
        case emailStatus = "email_status"
        case lastName = "last_name"
        case streetName = "street_name"
        case deviceTokenIos = "device_token_ios"
        case mobileStatus = "mobile_status"
        case zipcode
        case loginStatus = "login_status"
        case customerID = "customerId"
        case mobile, username
        case oauthUid = "oauth_uid"
        case bankName = "bank_name"
        case password
        case bankUserName = "bank_user_name"
        case gender
        case houseNumber = "house_number"
        case primaryEmail = "primary_email"
        case referCode = "refer_code"
        case firstName = "first_name"
        case dateOfBirth = "date_of_birth"
        case locale
        case cityName = "city_name"
        case longitude, id
        case deviceToken = "device_token"
        case address
        case verificationCode = "verification_code"
        case verificationCodeMobile = "verification_code_mobile"
        case aboutUser = "about_user"
        case token
    }
}

