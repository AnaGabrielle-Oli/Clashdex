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

    var body: some View {
        if rarityWord.contains(keyWord) {
            GridCards(filterType: "rarity", typeInFilter: keyWord)
        } else if typeWord.contains(keyWord) {
            GridCards(filterType: "type", typeInFilter: keyWord)
        } else {
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
                    ) {
                        ForEach(dataCards) { card in
                            CardInGrid(actualCard: card)
                        }
                    }
                    .padding()
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
    GridView(keyWord: "")
}
