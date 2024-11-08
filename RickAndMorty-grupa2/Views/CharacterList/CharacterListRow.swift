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
            Text(character.gender.rawValue)
                .font(.callout)
        }
        .font(.largeTitle)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CharacterListRow(
        character: .init(
            name: "Rick Sanchez",
            gender: .male
        )
    )
}
