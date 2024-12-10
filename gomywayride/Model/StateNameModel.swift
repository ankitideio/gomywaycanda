//
//  StateNameModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 20/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - StateNameModel
struct StateNameModel: Codable {
    let message: String?
    let status: Bool?
    let data: [GetStatesData]?
}

// MARK: - Datum
struct GetStatesData: Codable {
    let name, id: String?
}
