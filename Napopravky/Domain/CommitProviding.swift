//
//  CommitProviding.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 28.05.2022.
//

import Foundation

protocol CommitProviding {
    func getFirstCommit(commitUrl: String, completion: @escaping (Commit) -> Void)
}
