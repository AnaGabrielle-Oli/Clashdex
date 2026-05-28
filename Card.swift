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
    //let type: String      --> agora as cartas estao dentro de um array e o tipo é o nome do array
    let rarity: String
    let arena: Int
    let description: String
    let isEvolved: Bool
    let highresImageFilename: String
}

