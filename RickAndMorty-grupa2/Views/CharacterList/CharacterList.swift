//
//  CharacterList.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

struct CharacterList: View {
    
    var characters: [String]
    
    var body: some View {
        bodyAsList
//        bodyAsForEachInVStack
//        bodyAsForEachInLazyVStack
    }
    
    var bodyAsList: some View {
        List(characters, id: \.self) { character in
            Text(character)
        }
    }
    
    var bodyAsForEachInVStack: some View {
        ScrollView {
            VStack {
                ForEach(characters, id: \.self) { character in
                    Text(character)
                }
            }
        }
    }
    
    var bodyAsForEachInLazyVStack: some View {
        ScrollView {
            LazyVStack {
                ForEach(characters, id: \.self) { character in
                    Text(character)
                }
            }
        }
    }
}

#Preview {
    CharacterList(characters: [
        "Rick",
        "Morty",
    ])
}
