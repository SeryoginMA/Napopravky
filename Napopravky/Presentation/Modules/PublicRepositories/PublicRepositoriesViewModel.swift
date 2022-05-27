//
//  PublicRepositoriesViewModel.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

class PublicRepositoriesViewModel: ObservableObject, Identifiable {

    @Published var repositories: [Repository] = []
    
    func showRepositoryDetails(repository: Repository) {
        print(repository.id)
    }
    
    func loadData() {
        guard let url = URL(string: "https://api.github.com/repositories") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let jsonResult = try JSONDecoder().decode([Repository].self, from: data)
                self.repositories = jsonResult
            }
            catch {
                print(error)
            }
        }

        task.resume()
    }
}
