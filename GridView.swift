//
//  GridView.swift
//  Clashdex
//
//  Created by Aluno Mack on 26/05/26.
//

import SwiftUI



struct GridView: View {
    let keyWord: String

    let rarityWord: [String] = ["Common", "Rare", "Epic", "Legendary", "Champion"]
    let typeWord: [String] = ["Troop", "Building", "Spell"]
    
    static let cardCategories: [String: [String]] = [
        "goblin": [
            "Goblins", "Spear Goblins", "Goblin Hut", "Goblin Barrel",
            "Goblin Gang", "Goblin Giant", "Goblin Drill", "Goblin Demolisher",
            "Goblin Machine", "Goblin Curse"
        ],
        
        "aerial": [
            "Minions", "Mega Minion", "Minion Horde", "Baby Dragon", "Inferno Dragon",
            "Electro Dragon", "Skeleton Dragons", "Phoenix", "Lava Hound", "Bats"
        ],
        
        "barbarian": [
            "Barbarians", "Elite Barbarians", "Barbarian Hut", "Barbarian Barrel", "Battle Ram"
        ],
        
        "skeleton": [
            "Skeletons", "Skeleton Army", "Skeleton Barrel", "Skeleton Dragons",
            "Bomber", "Wall Breakers", "Witch", "Night Witch", "Giant Skeleton",
            "Skeleton King", "Graveyard", "Bomb Tower"
        ],
        
        "tank": [
            "Giant", "Golem", "P.E.K.K.A.", "Mega Knight", "Electro Giant",
            "Royal Giant", "Lava Hound", "Giant Skeleton", "Elixir Golem"
        ],
        
        "winCondition": [
            "Giant", "Golem", "Electro Giant", "Royal Giant", "Lava Hound",
            "Hog Rider", "Ram Rider", "Battle Ram", "Balloon", "Goblin Barrel",
            "Goblin Drill", "Graveyard", "Miner", "Wall Breakers", "Three Musketeers",
            "X-Bow", "Mortar", "Elixir Golem"
        ],
        
        "evolved": [
            "Skeletons", "Barbarians", "Mortar", "Royal Giant", "Knight",
            "Recruits", "Archers", "Ice Spirit", "Valkyrie", "Bomber",
            "Wall Breakers", "Zap", "Battle Ram", "Wizard", "Goblin Giant",
            "Tesla", "Cage", "P.E.K.K.A", "Mega Knight", "Electro Dragon", "Musketeer"
        ]
    ]
    
    var body: some View {
        if rarityWord.contains(keyWord) {
            GridCards(filterType: "rarity", typeInFilter: keyWord)
        } else if typeWord.contains(keyWord) {
            GridCards(filterType: "type", typeInFilter: keyWord)
        }else{
            GridCards(filterType: "name", typeInFilter: keyWord)
        }
    }
}

struct GridCards: View {
    let filterType: String
    let typeInFilter: String
    
    let columnsCount: Int = 4
    let gridSpacing: CGFloat = 16
    
    @State private var dataCards: [Card] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView("Carregando cartas...")
            } else if dataCards.isEmpty {
                Text("Não encontrado!")
            } else {
                ScrollView {
                    LazyVGrid(
                        columns: Array(
                            repeating: GridItem(.flexible(), spacing: gridSpacing),
                            count: columnsCount
                        ),
                        spacing: gridSpacing
                    ){
                        if typeInFilter == "goblinCards"{
                            let filteredGoblins = dataCards.filter { card in
                                goblinCards.contains(card.name)
                            }
                            
                            
                        }
                        ForEach(filteredGoblins, id: \.id) { card in
                            CardInGrid(actualCard: card)
                        }else{
                            ForEach(dataCards) { card in
                                CardInGrid(actualCard: card)
                            }
                            
                        }
                            .padding()
                    }
                }
            }
        }
        .task(id: "\(filterType)-\(typeInFilter)") {
            isLoading = true
            
            do {
                let fetchedCards = try await CardsAPI.fetchCard(filterType, typeInFilter)
                dataCards = fetchedCards
            } catch {
                print("Erro ao buscar ou decodificar cartas: \(error)")
            }
            
            isLoading = false
        }
    }
}

struct CardInGrid: View {
    var actualCard: Card
    
    var body: some View {
        NavigationLink {
            CardView(card: actualCard)
        } label: {
            AsyncImage(url: actualCard.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 73, height: 96)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width: 73, height: 96)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    GridView(keyWord: "Common")
}

