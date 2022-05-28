//
//  RepositoryView.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

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
            
            Text(viewModel.repository.name)
                .bold()
                .font(.system(.title))
                .padding(.top, 16)
            
            VStack {
                Text("Last commit")
                    .bold()
                    .font(.system(.title2))
                    .padding(.top, 8)
                
                Text("Author")
                    .bold()
                    .padding(.vertical, 2)
                
                Text(viewModel.commitAuthorName)
                
                Text("Message")
                    .bold()
                    .padding(.vertical, 2)
                
                Text(viewModel.commitMessage)
                
                Text("Parents:")
                    .bold()
                    .padding(.top, 2)
            
                ForEach(viewModel.commitParentsSha, id: \.self) { sha in
                    Text(sha)
                        .padding(.vertical, 2)
                }
            }
                
            Text(viewModel.commitDate.customDateRepresentation() )
            
            Spacer()
        }
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(viewModel: RepositoryViewModel(repository: Repository(id: 1, name: "123", owner: Owner(login: "John", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4"), commitUrl: "https://api.github.com/repos/mojombo/grit/commits?per_page=1")))
    }
}
