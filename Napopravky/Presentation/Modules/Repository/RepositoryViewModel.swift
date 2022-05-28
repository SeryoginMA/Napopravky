//
//  RepositoryViewModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

class RepositoryViewModel: ObservableObject, Identifiable {
    
    private let provider: CommitProviding = CommitProvider()
    
    var repository: Repository
    
    @Published var commitAuthorName: String = ""
    @Published var commitMessage: String = ""
    @Published var commitDate: String = ""
    @Published var commitParentsSha: [String] = []
    
    init(repository: Repository) {
        self.repository = repository
        getCommit(commitUrl: "https://api.github.com/repos/mojombo/grit/commits")
    }
    
    private func getCommit(commitUrl: String) {
        provider.getFirstCommit(commitUrl: commitUrl) { commit in
            self.commitAuthorName = commit.details.author.name
            self.commitMessage = commit.details.message
            self.commitDate = commit.details.author.date
            for parent in commit.parents {
                self.commitParentsSha.append(parent.sha)
            }
        }
    }
}
