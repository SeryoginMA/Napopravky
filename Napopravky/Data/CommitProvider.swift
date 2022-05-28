//
//  CommitProvider.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 28.05.2022.
//

import Foundation

final class CommitProvider: CommitProviding {
    
    func getFirstCommit(commitUrl: String, completion: @escaping (Commit) -> Void) {
        guard let url = URL(string: commitUrl + "?per_page=1") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let jsonResult = try JSONDecoder().decode([Commit].self, from: data)
                
                if let commit = jsonResult.first {
                    DispatchQueue.main.async {
                        completion(commit)
                    }
                }

            }
            catch {
                print(error)
            }
        }

        task.resume()
    }
}
