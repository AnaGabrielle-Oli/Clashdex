//
//  GridView.swift
//  Clashdex
//
//  Created by Aluno Mack on 26/05/26.
//

import SwiftUI

struct GridView: View {
    let keyWord: String
    
    let rarityWord: [String] = ["Common", "Rare", "Epic", "Legendary"]
    let typeWord: [String] = ["Troop", "Building", "Spell"]
    
    var body: some View {
        if !rarityWord.contains(keyWord) && !typeWord.contains(keyWord){
            Text("Não encontrado!")
        }else{
            if rarityWord.contains(keyWord){
                GridCards(filterType:"rarity", typeInFilter: keyWord)
            }else if typeWord.contains(keyWord){
                GridCards(filterType:"type", typeInFilter: keyWord)
            }
        }
    }
}

struct GridCards: View {
    let filterType: String
    let typeInFilter: String
    
    let columnsCount: Int = 4
    let gridSpacing: CGFloat = 16

    @State var dataCards: [Card]?

    var body: some View {

         ScrollView {
             LazyVGrid(columns: Array(repeating: .init(
                        .flexible(), spacing: gridSpacing
                    ),
                    count: columnsCount
             )) {
                 if let cards = dataCards {
                     ForEach(cards) { card in
                         CardInGrid(actualCard: card)
                     }
                 }
             }
         }.task {
             //try? await self.dataCards = CardsAPI.fetchCard(filterType, typeInFilter)     a tel ficava branca sem nada
             do {
                     
                     let fetchedCards = try await CardsAPI.fetchCard(filterType, typeInFilter)
                     print("Sucesso! Baixou \(fetchedCards.count) cartas.")
                     self.dataCards = fetchedCards
                 } catch {
                    
                     print("Erro ao buscar ou decodificar cartas: \(error)")
                 }
         }
    }
}

struct CardInGrid: View {
    var actualCard: Card
    var body: some View{
        Button{
            CardView()
        }label:{
            Image(actualCard.highresImageFilename)
                .resizable()
                .scaledToFill()
                .frame(width: 73, height: 96) // Força o tamanho do card
                .clipped()
        }
        .frame(width: 73, height: 96)
        .cornerRadius(10)
    }
}

#Preview {
    GridView(keyWord: "Common")
}
