//
//  AboutModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - AboutModel
struct AboutModel: Codable {
    let message: String?
    let status: Bool?
    let data: AboutData?
}

// MARK: - DataClass
struct AboutData: Codable {
    let description, updatedAt, createdAt: String?
    let imageURL: String?
    let description_franch:String?
    let slug, title, id: String?

    enum CodingKeys: String, CodingKey {
        case description
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case imageURL = "image_url"
        case slug, title, id,description_franch
    }
}
