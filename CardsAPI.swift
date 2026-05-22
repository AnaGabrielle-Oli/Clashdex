//
//  CardsAPI.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import Foundation

struct CardsAPI{
    static let endpoint = URL(string: "https://royaleapi.github.io/cr-api-data/json/cards.json")!
                              
    static var decoder: JSONDecoder{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
                              
    static func fetchCard() async throws -> [Card]{
        let request = URLRequest(url: endpoint, cachePolicy: .returnCacheDataElseLoad)
        
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let cards = try decoder.decode([Card].self, from: data)
        return cards
    }
}
