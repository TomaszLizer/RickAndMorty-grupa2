//
//  RickAndMorty_grupa2App.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import SwiftUI

@main
struct RickAndMorty_grupa2App: App {
    
    let characters = (1...10000).map { "Character \(String($0))" }
    
    var body: some Scene {
        WindowGroup {
            
            CharacterList(characters: characters)
        }
    }
}
