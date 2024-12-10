//
//  AddEmailModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 26/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation

struct AddEmailModel: Codable {
    let data: [Email]?
    let message: String?
    let status: Bool?
}

struct Email: Codable {
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
