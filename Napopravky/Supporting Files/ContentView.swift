//
//  ContentView.swift
//  Napopravky
//
//  Created by Михаил Серёгин on 26.05.2022.
//

import SwiftUI

struct Repository: Identifiable, Decodable {
    let id: Int
    let name: String
    let owner: Owner
}

struct Owner: Decodable {
    let login: String
    let avatarUrl: String
    
    private enum CodingKeys : String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}

struct ContentView: View {
    var tutors = [Repository(id: 1, name: "123", owner: Owner(login: "123", avatarUrl: "123123"))]
    
    var body: some View {
        
        List(tutors) { tutor in
            HStack {
                Image(systemName: "photo")
                
                VStack{
                    
                    Text(tutor.name)
                    Text(String(tutor.id))
                        .foregroundColor(.yellow)
                }

            }
        }
        
        .onTapGesture {
            print()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
    }
}
