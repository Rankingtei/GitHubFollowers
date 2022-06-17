//
//  User.swift
//  GitHubFollowers
//
//  Created by Tei Akpotosu-Nartey on 6/16/22.
//

import Foundation

struct User: Codable{
    var login: String
    var AvatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var PublicGists: Int
    var htmlUrl: String
    var follwing: Int
    var followers: Int
    var createdAt: String
    
    
}
