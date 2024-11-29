//
//  RickAndMorty_grupa2App.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

@main
struct RickAndMorty_grupa2App: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CharacterList(characters: charactersMock)
                    .navigationTitle("Rick and Morty")
                    .navigationDestination(for: Character.self) { character in
                        CharacterDetailsView(character: character)
                            .navigationTitle(character.name)
                    }
            }
        }
    }
}
