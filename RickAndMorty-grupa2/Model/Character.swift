//
//  Character.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import Foundation

struct CharacterResponse: Decodable {
    let results: [Character]
}

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let gender: Gender
}

extension Character {
    
    init(
        identifier: Int = UUID().hashValue,
        name: String = "Rick Sanchez",
        gender: Gender = .unknown
    ) {
        self.init(
            id: identifier,
            name: name,
            gender: gender
        )
    }
}

enum Gender: String, Decodable{
    case male = "Male"
    case female = "Female"
    case unknown
    case genderless = "Genderless"
}
