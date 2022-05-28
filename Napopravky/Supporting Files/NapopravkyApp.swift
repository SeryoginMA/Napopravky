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
            let viewModel = PublicRepositoriesViewModel(provider: RepositoryProvider())
            PublicRepositoriesView(viewModel: viewModel)
        }
    }
}
