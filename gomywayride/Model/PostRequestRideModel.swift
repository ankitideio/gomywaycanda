//
//  PostRequestRideModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 27/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation


struct PostRequestRideModel: Codable {
    let data: [Ride]?
    let message: String?
    let status: Bool?
}

struct Ride: Codable {
    let availableSeats: Int?
    let avgRating: Int?
    let backRowSeating: Int?
    let bookingPreference: Int?
    let bookings: Int?
    let carInsurance: String?
    let cityName: String?
    let createdAt: String?
    let deletedAt: String?
    let description: String?
    let destination: String?
    let driverId: Int?
    let driverImageUrl: String?
    let eventId: String?
    let firstName: String?
    let houseNumber: Int?
    let id: String?
    let lastName: String?
    let leaving: String?
    let luggage: Int?
    let mobile: Int?
    let model: Int?
    let numberOfReviews: Int?
    let origin: String?
    let originPoint: String?
    let others: String?
    let pendingSeats: Int?
    let plateNumber: Int?
    let postedTripId: String?
    let pricePerSeat: String?
    let profileImageUrl: String?
    let profileUrl: String?
    let returning: String?
    let stateName: String?
    let stopPoint: String?
    let streetName: Int?
    let totalSeats: Int?
    let tripId: Int?
    let tripPrice: Int?
    let tripStatus: Int?
    let tripType: Int?
    let updatedAt: String?
    let userId: Int?
    let userVehicleId: Int?
    let username: String?
    let vehicleId: Int?
    let vehicleName: String?
    let vehicleType: String?
    let vehicleTypeId: Int?
    let vehicleUrl: String?
    let views: String?
}
