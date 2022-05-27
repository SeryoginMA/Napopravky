//
//  RepositoryViewModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

class RepositoryViewModel: ObservableObject, Identifiable {
    
    @Published var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
}
