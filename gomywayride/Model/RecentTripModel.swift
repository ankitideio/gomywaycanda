//
//  RecentTripModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - RecentTripModel
struct RecentTripModel: Codable {
    let message: String?
    let status: Bool?
    let data: [RecentTripData]?
}

// MARK: - Datum
struct RecentTripData: Codable {
    let updatedAt, views: String?
    let createdAt, tripType, totalSeats, profileURL: String?
    let luggage, firstName: String?
    let deletedAt: String?
    let origin, username, destination, pricePerSeat: String?
    let returning: String?
    let tripID, lastName: String?
    let bookings: Int?
    let driverID, backRowSeating: String?
    let eventID: String?
    let id, tripStatus, others: String?
    let userVehicleID, description, leaving, bookingPreference: String?
//    let pendingSeats: Int?
    let availableSeats:String?

    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case views
        case createdAt = "created_at"
        case tripType = "trip_type"
        case totalSeats = "total_seats"
        case profileURL = "profile_url"
        case luggage
        case firstName = "first_name"
        case deletedAt = "deleted_at"
        case origin, username, destination
        case pricePerSeat = "price_per_seat"
        case returning
        case tripID = "trip_id"
        case lastName = "last_name"
        case bookings
        case driverID = "driver_id"
        case backRowSeating = "back_row_seating"
        case eventID = "event_id"
        case id
        case tripStatus = "trip_status"
        case others
        case availableSeats = "available_seats"
        case userVehicleID = "user_vehicle_id"
        case description, leaving
        case bookingPreference = "booking_preference"
//        case pendingSeats = "pending_seats"
    }
}
