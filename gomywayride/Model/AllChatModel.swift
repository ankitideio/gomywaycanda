//
//  AllChatModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - AllChatModel
struct AllChatModel: Codable {
    let status: Bool?
    let data: [GetChatData]
    let message: String?
}

// MARK: - Datum
struct GetChatData: Codable {
    let lastMessage, conversationID: String?
    let requestID: String?
    let id: String?
    let profileImage: String?
    let firstName, profileURL, createdAt, lastName: String?
    let newMessages: Int?
    let userID, fromUserID, notification, username: String?
    let notificationLink: String?
    let timeString: Int?
    let time: String?
    let tripID, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case lastMessage = "last_message"
        case conversationID = "conversation_id"
        case requestID = "request_id"
        case id
        case profileImage = "profile_image"
        case firstName = "first_name"
        case profileURL = "profile_url"
        case createdAt = "created_at"
        case lastName = "last_name"
        case newMessages = "new_messages"
        case userID = "user_id"
        case fromUserID = "from_user_id"
        case notification, username
        case notificationLink = "notification_link"
        case timeString = "time_string"
        case time
        case tripID = "trip_id"
        case updatedAt = "updated_at"
    }
}
