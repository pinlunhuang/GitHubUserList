//
//  User.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import Foundation

struct User: Codable {
  let login: String
  let id: Int
  let avatarURL: String
  let htmlURL: String
  let type: String
  let siteAdmin: Bool
  
  private enum CodingKeys: String, CodingKey {
    case login
    case id
    case avatarURL = "avatar_url"
    case htmlURL = "html_url"
    case type
    case siteAdmin = "site_admin"
  }
}
