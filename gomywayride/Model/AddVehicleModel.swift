//
//  AddVehicleModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 26/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
struct AddVehicleModel: Codable {
    let message: String?
    let status: Bool?
    let data: AddVehicalData?
}

struct AddVehicalData: Codable {
    let vehicleTypes: [VehicleType]?
    let vehicles: [Vehicle]?
    
    enum CodingKeys: String, CodingKey {
        case vehicleTypes = "vehicle_types"
        case vehicles
    }
}

struct VehicleType: Codable {
    let deletedAt: String?
    let vehicleType: String?
    let id: String?
    let updatedAt: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case deletedAt = "deleted_at"
        case vehicleType = "vehicle_type"
        case id
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
}

struct Vehicle: Codable {
    let deletedAt: String?
    let vehicleName: String?
    let id: String?
    let status: String?
    let updatedAt: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case deletedAt = "deleted_at"
        case vehicleName = "vehicle_name"
        case id
        case status
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
}
