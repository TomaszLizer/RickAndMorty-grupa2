//
//  CharacterListRow.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct CharacterListRow: View {
    var character: Character
    
    @State private var image = UIImage(resource: .avatarPlaceholder)
    
    var body: some View {
        details
            .shadow(color: .white, radius: 5, x: 2, y: 2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .listRowBackground(avatar.blur(radius: 5))
            .task {
                let session = URLSession(configuration: .ephemeral)
                do {
                    let (imageData, _) = try await session.data(from: character.image)
                    if let image = UIImage(data: imageData) {
                        self.image = image
                    }
                } catch {
                    // handle error
                }
            }
    }
    
    private var avatar: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
    
    private var details: some View {
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
