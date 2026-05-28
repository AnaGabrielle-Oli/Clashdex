//
//  Card.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import Foundation

struct Card: Decodable, Identifiable {
    let id: Int
    let key: String
    let name: String
    let elixir: Int
    let type: String
    let rarity: String
    let arena: Int
    let description: String
    let isEvolved: Bool

    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/RoyaleAPI/cr-api-assets/master/cards-150/\(key).png")
    }
    
    
}

extension Card {
    static let exemplo = Card(
        id: 0,
        key: "knight",
        name: "nome da carta",
        elixir: 3,
        type: "Troop",
        rarity: "Common",
        arena: 1,
        description: "descricao da carta",
        isEvolved: false
    )
}

