//
//  PublicRepositoriesViewModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

class PublicRepositoriesViewModel: ObservableObject, Identifiable {

    private let provider: RepositoryProviding
    
    @Published var repositories: [Repository] = []
    
    init(provider: RepositoryProviding) {
        self.provider = provider
        getRepositories()
    }
    
    func showRepositoryDetails(repository: Repository) -> RepositoryView {
        
        let viewModel = RepositoryViewModel(provider: CommitProvider(), repository: repository)
        return RepositoryView(viewModel: viewModel)
    }
    
    private func getRepositories() {
        provider.getPublicRepositories(){ repositories in
            self.repositories = repositories
        }
    }
}
