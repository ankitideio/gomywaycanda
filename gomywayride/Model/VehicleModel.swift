//
//  VehicleModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 25/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - VehicleModel
struct VehicleModel: Codable {
    let data: VehicleData?
    let message: String?
    let status: Bool?
}

// MARK: - DataClass
struct VehicleData: Codable {
    let userVehicles: [UserVehicle]?
}

// MARK: - UserVehicle
struct UserVehicle: Codable {
    let model, plateNumber: String?
    let carInsurance: String?
    let createdAt, userID, id: String?
    let vehicleImageURL: String?
    let vehicleURL, vehicleUserID, vehicleType, vehicleTypeID: String?
    let vehicleName, vehicleID: String?
    let updatedAt, deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case model
        case plateNumber = "plate_number"
        case carInsurance = "car_insurance"
        case createdAt = "created_at"
        case userID = "user_id"
        case id
        case vehicleImageURL = "vehicle_image_url"
        case vehicleURL = "vehicle_url"
        case vehicleUserID = "vehicle_user_id"
        case vehicleType = "vehicle_type"
        case vehicleTypeID = "vehicle_type_id"
        case vehicleName = "vehicle_name"
        case vehicleID = "vehicle_id"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}

