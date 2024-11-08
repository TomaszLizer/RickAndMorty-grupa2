//
//  CharacterList.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct CharacterList: View {
    
    var characters: [Character]
    
    var body: some View {
        bodyAsList
    }
    
    var bodyAsList: some View {
        List(characters) { character in
            CharacterListRow(character: character)
        }
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
