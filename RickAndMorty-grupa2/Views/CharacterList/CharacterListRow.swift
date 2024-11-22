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
        details
            .shadow(color: .white, radius: 5, x: 2, y: 2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .listRowBackground(avatar.blur(radius: 5))
    }
    
    private var avatar: some View {
        AsyncImage(url: character.image) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(.avatarPlaceholder)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
    
    private var details: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text(character.name)
                .font(.title)
            HStack {
                let gender = character.gender
                Image(systemName: gender.symbolName)
                    .foregroundStyle(gender.symbolColor)
                Text(character.status.emoji)
                Text(character.species)
                Text(character.type)
            }
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
