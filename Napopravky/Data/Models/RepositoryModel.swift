//
//  RepositoryModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 28.05.2022.
//

import Foundation

struct Repository: Identifiable, Decodable {
    let id: Int
    let name: String
    let owner: Owner
    let commitUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case commitUrl = "commits_url"
    }
}

struct Owner: Decodable {
    let login: String
    let avatarUrl: String
    
    private enum CodingKeys : String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
