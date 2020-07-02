//
//  UserCodable.swift
//  GitHubUserListExample
//
//  Created by Pinlun Huang on 2020/7/2.
//  Copyright © 2020 Pinlun Huang. All rights reserved.
//

import Foundation

struct UserCodable: Codable {
    
    let avatarUrl: String?
    let eventsUrl: String?
    let followersUrl: String?
    let followingUrl: String?
    let gistsUrl: String?
    let gravatarId: String?
    let htmlUrl: String?
    let id: Int?
    let login: String?
    let nodeId: String?
    let organizationsUrl: String?
    let receivedEventsUrl: String?
    let reposUrl: String?
    let siteAdmin: Bool?
    let starredUrl: String?
    let subscriptionsUrl: String?
    let type: String?
    let url: String?
    let location: String?
    let blog: String?
    let name: String?
    let bio: String?
    let company: String?
    let email: String?
    let hirable: Bool?
    let twitterUsername: String?
    let publicRepos: Int?
    let publicGists: Int?
    let followers: Int?
    let following: Int?
    let createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case eventsUrl = "events_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case gravatarId = "gravatar_id"
        case htmlUrl = "html_url"
        case id = "id"
        case login = "login"
        case nodeId = "node_id"
        case organizationsUrl = "organizations_url"
        case receivedEventsUrl = "received_events_url"
        case reposUrl = "repos_url"
        case siteAdmin = "site_admin"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case type = "type"
        case url = "url"
        case location = "location"
        case blog = "blog"
        case name = "name"
        case bio = "bio"
        case company = "company"
        case email = "email"
        case hirable = "hireable"
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        followersUrl = try values.decodeIfPresent(String.self, forKey: .followersUrl)
        followingUrl = try values.decodeIfPresent(String.self, forKey: .followingUrl)
        gistsUrl = try values.decodeIfPresent(String.self, forKey: .gistsUrl)
        gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        organizationsUrl = try values.decodeIfPresent(String.self, forKey: .organizationsUrl)
        receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
        reposUrl = try values.decodeIfPresent(String.self, forKey: .reposUrl)
        siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin)
        starredUrl = try values.decodeIfPresent(String.self, forKey: .starredUrl)
        subscriptionsUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        blog = try values.decodeIfPresent(String.self, forKey: .blog)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        hirable = try values.decodeIfPresent(Bool.self, forKey: .hirable)
        twitterUsername = try values.decodeIfPresent(String.self, forKey: .twitterUsername)
        publicRepos = try values.decodeIfPresent(Int.self, forKey: .publicRepos)
        publicGists = try values.decodeIfPresent(Int.self, forKey: .publicGists)
        followers = try values.decodeIfPresent(Int.self, forKey: .followers)
        following = try values.decodeIfPresent(Int.self, forKey: .following)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }
}
