//
//  HelpModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - HelpModel
struct HelpModel: Codable {
    let status: Bool?
    let message: String?
    let data: [HelpData]
}

struct HelpData: Codable {
    let createdAt,title,description,id,description_franch,title_franch: String?
    
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case description
        case id
        case title
        case description_franch
        case title_franch
    }
}
