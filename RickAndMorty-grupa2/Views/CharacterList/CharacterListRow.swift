//
//  CharacterListRow.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct CharacterListRow: View {
    var character: Character
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text(character.name)
                .font(.title)
            let gender = character.gender
            Image(systemName: gender.symbolName)
                .foregroundStyle(gender.symbolColor)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CharacterListRow(
        character: .init(
            name: "Rick Sanchez",
            gender: .genderless
        )
    )
}
