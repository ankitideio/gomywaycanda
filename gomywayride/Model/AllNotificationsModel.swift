//
//  AllNotificationsModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 23/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
struct AllNotificationsModel: Codable {
    let data: [NotificationData]
    let message: String?
    let status: Bool?
}

struct NotificationData: Codable {
    let conversationId: String?
    let createdAt: String?
    let firstName: String?
    let fromUserId: String?
    let id: String?
    let lastName: String?
    let notification: String?
    let notificationLink: String?
    let profileImageUrl: String?
    let requestId: String?
    let time: String?
    let timeCreated: String?
    let timeString: Int?
    let tripId: String?
    let updatedAt: String?
    let userId: String?
    let username: String?
    let notification_french:String?
    enum CodingKeys: String, CodingKey {
        case conversationId = "conversation_id"
        case createdAt = "created_at"
        case firstName = "first_name"
        case fromUserId = "from_user_id"
        case id
        case lastName = "last_name"
        case notification
        case notificationLink = "notification_link"
        case profileImageUrl = "profile_image_url"
        case requestId = "request_id"
        case time
        case timeCreated = "time_created"
        case timeString = "time_string"
        case tripId = "trip_id"
        case updatedAt = "updated_at"
        case userId = "user_id"
        case username
        case notification_french
    }
}
