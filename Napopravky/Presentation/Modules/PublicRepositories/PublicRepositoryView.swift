//
//  PublicRepositoryView.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 27.05.2022.
//

import SwiftUI

struct PublicRepositoriesView: View {
    
    @ObservedObject var viewModel: PublicRepositoriesViewModel
    
    init(viewModel: PublicRepositoriesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            List(viewModel.repositories) { repository in
                HStack {
                    NavigationLink(destination: viewModel.showRepositoryDetails(repository: repository)) {
                        AsyncImage(url: URL(string: repository.owner.avatarUrl)){ image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(repository.name)
                                .font(.system(size: 20))
                            Text(repository.owner.login)
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

//struct PublicRepositoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PublicRepositoriesView(viewModel: PublicRepositoriesViewModel())
//    }
//}

