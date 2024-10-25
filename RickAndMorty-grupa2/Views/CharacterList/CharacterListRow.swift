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
        Text(character.name)
    }
}
