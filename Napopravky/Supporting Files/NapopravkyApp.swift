//
//  NapopravkyApp.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 26.05.2022.
//

import SwiftUI

@main
struct NapopravkyApp: App {
    var body: some Scene {
        WindowGroup {
//            PublicRepositoriesView(viewModel: PublicRepositoriesViewModel())
            
            RepositoryView(viewModel: RepositoryViewModel(repository: Repository(id: 1, name: "123", owner: Owner(login: "John", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4"))))
        }
    }
}
