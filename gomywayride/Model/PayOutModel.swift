//
//  PayOutModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let message: String
//    let data: [[String: String?]]
//    let status: Bool
//}

import Foundation
struct PayOutModel: Codable {
    let message: String?
    let data: [PayOutData]
    let status: Bool?
}

struct PayOutData: Codable {
    let luggage: String?
    let trip_type: String?
    let description: String?
    let deleted_at: String?
    let email: String?
    let total_amount: String?
    let total_seats: String?
    let first_name: String?
    let refund_amount: String?
    let user_vehicle_id: String?
    let price_per_seat: String?
    let last_name: String?
    let passenger_id: String?
    let available_seats: String?
    let others: String?
    let returning: String?
    let leaving: String?
    let booking_preference: String?
    let created_at: String?
    let back_row_seating: String?
    let id: String?
    let trip_status: String?
    let request_id: String?
    let origin: String?
    let transaction_id: String?
    let discount: String?
    let payment_status: String?
    let posted_trip_id: String?
    let service_charges: String?
    let event_id: String?
    let destination: String?
    let driver_id: String?
    let views: String?
    let updated_at: String?
    let seats_booked: String?
    let user_id: String?
    let seats_amount: String?
    let jsonData: String?
    let posted_trip_stops_id: String?
}
