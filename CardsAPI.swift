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
                              
    static func fetchCard(_ filterType: String? = nil,_ typeInFilter: String? = nil) async throws -> [Card]{
        let request = URLRequest(url: endpoint, cachePolicy: .returnCacheDataElseLoad)
        
        let (data, _) = try await URLSession.shared.data(for: request)
                
        let cards = try decoder.decode([Card].self, from: data)
        
        if let activeFilter = typeInFilter{
            if filterType == "rarity"{
                let filteredCards = cards.filter{ $0.rarity == activeFilter }
                return filteredCards
            }else if filterType == "name"{
                let filteredCards = cards.filter{ $0.name == activeFilter }
                return filteredCards
            }
            //Quando tiver um type tem que por essa parte do codigo:
            /*else if filterType == "type"{
                let filteredCards = cards.filter{ $0.type == activeFilter }
                return filteredCards
            }*/
        }
        return cards
    }
}
