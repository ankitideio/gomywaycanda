//
//  SendMessageModel.swift
//  GomywayCanada
//
//  Created by meet sharma on 27/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation


// MARK: - SendMessageModel
struct SendMessageModel: Codable {
  let status: Bool?
  let data: sendMessageData?
  let message: String?
}
// MARK: - Datum
struct sendMessageData: Codable {
  let conversationId: String?
  let createdAt: String?
  let deletedAt: String?
  let file: String?
  let filePath: String?
  let fromUser: String?
  let fromUserImg: String?
  let fromUserFirstName: String?
  let fromUserLastName: String?
  let fromId: String?
  let fromImageUrl: String?
  let id: String?
  let message: String?
  let seen: String?
  let time: String?
  let timeCreated: String?
  let timeString: Int?
  let toUser: String?
  let toUserImg: String?
  let toUserFirstName: String?
  let toUserLastName: String?
  let toId: String?
  let toImageUrl: String?
  let updatedAt: String?
  enum CodingKeys: String, CodingKey {
    case conversationId = "conversation_id"
    case createdAt = "created_at"
    case deletedAt = "deleted_at"
    case file
    case filePath = "file_path"
    case fromUser = "fromUser"
    case fromUserImg = "fromUserImg"
    case fromUserFirstName = "fromUser_firstName"
    case fromUserLastName = "fromUser_lastName"
    case fromId = "from_id"
    case fromImageUrl = "from_image_url"
    case id
    case message
    case seen
    case time
    case timeCreated = "time_created"
    case timeString = "time_string"
    case toUser = "toUser"
    case toUserImg = "toUserImg"
    case toUserFirstName = "toUser_firstName"
    case toUserLastName = "toUser_lastName"
    case toId = "to_id"
    case toImageUrl = "to_image_url"
    case updatedAt = "updated_at"
  }
}
