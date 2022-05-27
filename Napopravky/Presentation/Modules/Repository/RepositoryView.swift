//
//  RepositoryView.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

struct Commit {
    let sha: String
    let commit: Com?
    let parents: [Commit]?
}

struct Com {
    let author: Author
    let message: String
}

struct Author {
    let name: String
    let date: Date
}

struct RepositoryView: View {
    
    @ObservedObject var viewModel: RepositoryViewModel
    
    init(viewModel: RepositoryViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: viewModel.repository.owner.avatarUrl)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            Text(viewModel.repository.owner.login)
                .font(.system(.title))
            Spacer()
        }
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(viewModel: RepositoryViewModel(repository: Repository(id: 1, name: "123", owner: Owner(login: "John", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4"))))
    }
}
