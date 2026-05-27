//
//  CardsAPI.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import Foundation

struct CardsAPI{
    static let endpoint = URL(string: "https://royaleapi.github.io/cr-api-data/json/cards_stats.json")!
                              
    static var decoder: JSONDecoder{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
                              
    static func fetchCard(_ filter: String? = nil) async throws -> [Card]{
        let request = URLRequest(url: endpoint, cachePolicy: .returnCacheDataElseLoad)
        
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let cards = try decoder.decode([Card].self, from: data)
        
        if let activeFilter = filter{
            
        }
        return cards
    }
}
