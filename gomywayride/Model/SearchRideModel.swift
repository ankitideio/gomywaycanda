//
//  SearchRideModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 27/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - SearchRideModel
struct SearchRideModel: Codable {
    let message: String?
    let status: Bool?
    let data: [SearchRideData]?
}

// MARK: - Datum
struct SearchRideData: Codable {
    let postedTripID: String?
    let model, lastName, carInsurance, backRowSeating: String?
    let profileURL, plateNumber, description, totalSeats: String?
    let vehicleName, origin, userID, availableSeats: String?
    let pricePerSeat: String?
    let userVehicleID, firstName, streetName, bookingPreference: String?
    let vehicleID: String?
    let views: String?
    let driverImageURL: String?
    let tripID, mobile, tripType, vehicleURL: String?
    let eventID, deletedAt: String?
    let stateName, others: String?
    let pendingSeats: Int?
    let username: String?
    let originPoint, stopPoint, id: String?
    let profileImageURL: String?
    let leaving: String?
    let createdAt, returning: String?
    let tripStatus, vehicleTypeID, luggage, houseNumber: String?
    let avgRating: Int?
    let tripPrice: String?
    let numberOfReviews: Int?
    let destination, vehicleType: String?
    let bookings: Int?
    let updatedAt: String?
    let cityName, driverID: String?

    enum CodingKeys: String, CodingKey {
        case postedTripID = "posted_trip_id"
        case model
        case lastName = "last_name"
        case carInsurance = "car_insurance"
        case backRowSeating = "back_row_seating"
        case profileURL = "profile_url"
        case plateNumber = "plate_number"
        case description
        case totalSeats = "total_seats"
        case vehicleName = "vehicle_name"
        case origin
        case userID = "user_id"
        case availableSeats = "available_seats"
        case pricePerSeat = "price_per_seat"
        case userVehicleID = "user_vehicle_id"
        case firstName = "first_name"
        case streetName = "street_name"
        case bookingPreference = "booking_preference"
        case vehicleID = "vehicle_id"
        case views
        case driverImageURL = "driver_image_url"
        case tripID = "trip_id"
        case mobile
        case tripType = "trip_type"
        case vehicleURL = "vehicle_url"
        case eventID = "event_id"
        case deletedAt = "deleted_at"
        case stateName = "state_name"
        case others
        case pendingSeats = "pending_seats"
        case username
        case originPoint = "origin_point"
        case stopPoint = "stop_point"
        case id
        case profileImageURL = "profile_image_url"
        case leaving
        case createdAt = "created_at"
        case returning
        case tripStatus = "trip_status"
        case vehicleTypeID = "vehicle_type_id"
        case luggage
        case houseNumber = "house_number"
        case avgRating
        case tripPrice = "trip_price"
        case numberOfReviews = "number_of_reviews"
        case destination
        case vehicleType = "vehicle_type"
        case bookings
        case updatedAt = "updated_at"
        case cityName = "city_name"
        case driverID = "driver_id"
    }
}
