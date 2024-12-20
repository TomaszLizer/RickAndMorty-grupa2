//
//  CharacterList.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct CharacterList: View {
    
    @State var characters: [Character]
    @State private var selectedCharacter: Character?
    @Environment(\.isPresented) var isPresented
    
    var body: some View {
        bodyAsList
    }
    
    @ViewBuilder
    var bodyAsList: some View {
        let _ = print("CharacterList isPresented: \(isPresented)")
        List(characters) { character in
            CharacterListRow(character: character)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCharacter = character
                }
        }
        .sheet(item: $selectedCharacter, content: { character in
            CharacterDetailsView(character: character)
        })
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
].map { Character(name: $0) }

#Preview {
    CharacterList(characters: charactersMock)
}
