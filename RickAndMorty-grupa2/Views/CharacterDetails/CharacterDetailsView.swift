//
//  CharacterDetailsView.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 29/11/2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.isPresented) var isPresented
    var character: Character
    
    var body: some View {
        let _ = print("CharacterDetailsView isPresented: \(isPresented)")
        VStack {
            Text(character.name)
                .font(.title)
                .padding()
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
