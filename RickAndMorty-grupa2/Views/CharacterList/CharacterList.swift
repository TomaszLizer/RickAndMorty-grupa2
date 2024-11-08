//
//  CharacterList.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct CharacterList: View {
    
    @State var characters: [Character]
    
    var body: some View {
        bodyAsList
    }
    
    var bodyAsList: some View {
        List(characters) { character in
            CharacterListRow(character: character)
        }
        .task {
            let characterUrlString = "https://rickandmortyapi.com/api/character"
            do {
                let response: CharacterResponse = try await object(fromUrlString: characterUrlString)
                characters = response.results
            } catch {
                // do nothing
            }
        }
    }
    
    func object<T: Decodable>(fromUrlString urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}

let charactersMock = [
    "Rick",
    "Morty",
    "Summer",
    "Beth",
    "Jerry",
    "Bender",
].map { Character(id: UUID().hashValue, name: $0) }

#Preview {
    CharacterList(characters: charactersMock)
}
