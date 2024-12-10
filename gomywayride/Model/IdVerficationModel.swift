//
//  IdVerficationModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - IdVerficationModel
struct IdVerficationModel: Codable {
    let data: IdVerficationData?
    let status: Bool?
    let message: String?
}

struct IdVerficationData: Codable {
    let createdAt: String?
    let deletedAt: String?
    let email: String?
    let firstNameId: String?
    let id: String?
    let identityProof: String?
    let identityProofUrl: String?
    let lastNameId: String?
    let status: String?
    let updatedAt: String?
    let userId: String?
    let username: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case email
        case firstNameId = "first_name_id"
        case id
        case identityProof = "identity_proof"
        case identityProofUrl = "identity_proof_url"
        case lastNameId = "last_name_id"
        case status
        case updatedAt = "updated_at"
        case userId = "user_id"
        case username
    }
}
