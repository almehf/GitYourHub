//
//  User.swift
//  GitYourHub
//
//  Created by Fahad Almehawas  on 2/20/20.
//  Copyright © 2020 Fahad Al. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var name: String?
    var avatarUrl: String

    var location: String?
    var htmlUrl: String
    var followers: Int
    var following: Int
    var publicGists: Int
    
    var createdAt: String
    var bio: String?
    var blog: String?
    var email: String?
    var company: String?
    var publicRepos: Int
}
