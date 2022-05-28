//
//  PublicRepositoriesViewModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

class PublicRepositoriesViewModel: ObservableObject, Identifiable {

    private let provider: RepositoryProviding = RepositoryProvider()
    
    var repositories: [Repository] = []
    
    func showRepositoryDetails(repository: Repository) {
        print(repository.id)
    }
    
    
}
