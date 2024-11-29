//
//  CharacterDetailsView.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 29/11/2024.
//

import SwiftUI

struct CharacterDetailsView: View {

    var character: Character
    
    var body: some View {
        Text(character.name)
            .font(.title)
            .padding()
    }
}
