//
//  CommitModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 28.05.2022.
//

import Foundation

struct Commit: Decodable {
    let sha: String
    let details: CommitDetails
    let parents: [Parent]
    
    private enum CodingKeys : String, CodingKey {
        case sha
        case details = "commit"
        case parents
    }
}

struct CommitDetails: Decodable {
    let author: Author
    let message: String
}

struct Author: Decodable {
    let name: String
    let date: String
}

struct Parent: Decodable {
    let sha: String
}
