//
//  RepositoryProvider.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 28.05.2022.
//

import Foundation

final class RepositoryProvider: RepositoryProviding {
    
    func getPublicRepositories(completion: @escaping ([Repository]) -> Void) {
        guard let url = URL(string: "https://api.github.com/repositories") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let jsonResult = try JSONDecoder().decode([Repository].self, from: data)
                DispatchQueue.main.async {
                    completion(jsonResult)
                }
            }
            catch {
                print(error)
            }
        }

        task.resume()
    }
}
