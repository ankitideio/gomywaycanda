//
//  TermsModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 26/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - TermsModel
struct TermsModel: Codable {
    let data: TermData?
    let message: String?
    let status: Bool?
}

// MARK: - DataClass
struct TermData: Codable {
    let title, id, createdAt, description: String?
    let slug, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case title, id
        case createdAt = "created_at"
        case description, slug
        case updatedAt = "updated_at"
    }
}
