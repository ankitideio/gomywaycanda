//
//  TripDetailModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 25/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - TripDetailModel
struct TripDetailModel: Codable {
    let message: String?
    let data: TripDetailData?
    let status: Bool?
}

// MARK: - DataClass
struct TripDetailData: Codable {
    let tripStopPoints: [TripStopPoint]?
    let tripStopRoutes: [TripStopRoute]?
    let viewTrip: ViewTrip?

    enum CodingKeys: String, CodingKey {
        case tripStopPoints = "trip_stop_points"
        case tripStopRoutes = "trip_stop_routes"
        case viewTrip
    }
}
struct TripStopPoint: Codable {
    let createdAt: String?
    let deletedAt: String?
    let id: String?
    let postedTripId: Int?
    let pricePerSeat: String?
    let stopLat: String?
    let stopLong: String?
    let stopPoint: String?
    let updatedAt: String?
    
}
struct TripStopRoute: Codable {
    let createdAt: String?
    let id: String?
    let originPoint: String?
    let postedTripId: Int?
    let pricePerSeat: String?
    let stopPoint: String?
    
   
}


// MARK: - ViewTrip
struct ViewTrip: Codable {
    let leaving, backRowSeating, description, lastName: String?
    let userVehicleID: String?
    let returning: String?
    let vehicleType, destination, bookingPreference, model: String?
    let carInsurance: String?
    let deletedAt: String?
    let vehicleID, tripType, driverID, pricePerSeat: String?
    let userID, plateNumber, others, createdAt: String?
    let pendingSeats: Int?
    let views: String?
    let tripStatus, totalSeats, luggage: String?
    let vehicleURLPath: String?
    let username, vehicleName: String?
    let eventID: String?
    let firstName, vehicleURL, availableSeats, tripID: String?
    let updatedAt: String?
    let origin, vehicleTypeID, id: String?

    enum CodingKeys: String, CodingKey {
        case leaving
        case backRowSeating = "back_row_seating"
        case description
        case lastName = "last_name"
        case userVehicleID = "user_vehicle_id"
        case returning
        case vehicleType = "vehicle_type"
        case destination
        case bookingPreference = "booking_preference"
        case model
        case carInsurance = "car_insurance"
        case deletedAt = "deleted_at"
        case vehicleID = "vehicle_id"
        case tripType = "trip_type"
        case driverID = "driver_id"
        case pricePerSeat = "price_per_seat"
        case userID = "user_id"
        case plateNumber = "plate_number"
        case others
        case createdAt = "created_at"
        case pendingSeats = "pending_seats"
        case views
        case tripStatus = "trip_status"
        case totalSeats = "total_seats"
        case luggage
        case vehicleURLPath = "vehicle_url_path"
        case username
        case vehicleName = "vehicle_name"
        case eventID = "event_id"
        case firstName = "first_name"
        case vehicleURL = "vehicle_url"
        case availableSeats = "available_seats"
        case tripID = "trip_id"
        case updatedAt = "updated_at"
        case origin
        case vehicleTypeID = "vehicle_type_id"
        case id
    }
}
