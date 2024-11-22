//
//  Character.swift
//  RickAndMorty-grupa2
//
//  Created by Tomasz Lizer on 25/10/2024.
//

import Foundation
import SwiftUI

struct CharacterResponse: Decodable {
    let results: [Character]
}

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let gender: Gender
    let status: Status
    let image: URL
    let species: String
    let type: String
}

extension Character {
    
    init(
        identifier: Int = UUID().hashValue,
        name: String = "Rick Sanchez",
        gender: Gender = .unknown,
        status: Status = .unknown,
        species: String = "Human",
        type: String = "Scientist",
        image: URL = URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!
    ) {
        self.init(
            id: identifier,
            name: name,
            gender: gender,
            status: status,
            image: image,
            species: species,
            type: type
        )
    }
}

enum Gender: String, Decodable{
    case male = "Male"
    case female = "Female"
    case unknown
    case genderless = "Genderless"
    
    var displayTitle: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        case .unknown: return "Unknown"
        case .genderless: return "Genderless"
        }
    }

    
    var symbolName: String {
        switch self {
        case .male: return "mustache.fill"
        case .female: return "mouth.fill"
        case .unknown: return "questionmark.folder"
        case .genderless: return "brain.fill"
        }
    }
    
    var symbolColor: Color {
        switch self {
        case .male: return .brown
        case .female: return .red
        case .unknown: return .gray
        case .genderless: return .pink
        }
    }
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    var emoji: String {
        switch self {
        case .alive:
            return "👶"
        case .dead:
            return "💀"
        case .unknown:
            return "❓"
        }
    }
}
    
