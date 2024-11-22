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
        HStack(alignment: .center) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
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
}

#Preview(traits: .sizeThatFitsLayout) {
    CharacterListRow(
        character: .init(
            name: "Rick Sanchez",
            gender: .genderless
        )
    )
}
