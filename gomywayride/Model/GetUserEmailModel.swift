//
//  GetUserEmailModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 26/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation

struct GetUserEmailModel: Codable {
    let data: EmailDataUser?
    let status: Bool?
    let message: String?
}

struct EmailDataUser: Codable {
    let other_emails: [OtherEmailUser]?
    let primary_email: PrimaryEmailUser?
}

struct OtherEmailUser: Codable {
    let created_at: String?
    let deleted_at: String?
    let email: String?
    let id: String?
    let status: String?
    let type: String?
    let updated_at: String?
    let user_id: String?
    let username: String?
    let verification_code: String?
}

struct PrimaryEmailUser: Codable {
    let about_user: String?
    let account_number: String?
    let address: String?
    let bankAccountId: String?
    let bank_code: String?
    let bank_name: String?
    let bank_user_name: String?
    let city_name: String?
    let created: String?
    let customerId: String?
    let date_of_birth: String?
    let device_token: String?
    let device_token_ios: String?
    let driver_suspended_on: String?
    let email: String?
    let email_status: String?
    let first_name: String?
    let forgot_password_link: String?
    let forgot_password_link_time: String?
    let gender: String?
    let house_number: String?
    let id: String?
    let last_name: String?
    let latitude: String?
    let locale: String?
    let login_status: String?
    let longitude: String?
    let mobile: String?
    let mobile_status: String?
    let modified: String?
    let oauth_provider: String?
    let oauth_uid: String?
    let password: String?
    let paystack_secret: String?
    let primary_email: Int?
    let profile_url: String?
    let refer_code: String?
    let state_name: String?
    let status: String?
    let street_name: String?
    let token: String?
    let user_type: String?
    let username: String?
    let uuid: String?
    let verification_code: String?
    let verification_code_mobile: String?
    let zipcode: String?
}
