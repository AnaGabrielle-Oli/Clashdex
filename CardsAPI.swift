//
//  CardsAPI.swift
//  Clashdex
//
//  Created by Aluno Mack on 22/05/26.
//

import Foundation

struct CardsAPI {
    static let endpoint = URL(string: "https://royaleapi.github.io/cr-api-data/json/cards.json")!

    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    static func fetchCard(_ filterType: String? = nil, _ typeInFilter: String? = nil) async throws -> [Card] {
        let request = URLRequest(url: endpoint, cachePolicy: .reloadIgnoringLocalCacheData)

        let (data, _) = try await URLSession.shared.data(for: request)

        let cards = try decoder.decode([Card].self, from: data)

        guard let filterType = filterType,
              let activeFilter = typeInFilter,
              !activeFilter.isEmpty else {
            return cards
        }

        if filterType == "rarity" {
            return cards.filter { $0.rarity == activeFilter }
        } else if filterType == "type" {
            return cards.filter { $0.type == activeFilter }
        } else if filterType == "name" {
            return cards.filter {
                $0.name.localizedCaseInsensitiveContains(activeFilter)
            }
        }

        return cards
    }
}
