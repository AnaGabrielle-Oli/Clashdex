//
//  Card.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import Foundation

struct Card: Decodable, Identifiable{
    let id: Int
    let key: String
    let name: String
    let elixir: Int
    let type: String
    let rarity: String
    let arena: Int
    let description: String
    let isEvolved: Bool
}

